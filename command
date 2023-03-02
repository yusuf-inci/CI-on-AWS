# Backup and Restore 
- The back up process of Jenkins, Nexus, SonarQube, Tomcat and restore Jenkins from back up on AWS (EC2 instances)

## Backup
- create s3 bucket. choose the region you usually use
- create iam role for ec2 instance and attach policy AmazonS3FullAccess or create 
your own restericted policy and attach it to iam role.
- attach the role to all instances you want to back up. 
- on EC2 Dashboard select your instance --> Actions --> Instance settings or 
(Security) --> Modify IAM role --> select the role and save

### Jenkins back up (ubuntu-focal-20.04)
- keep in mind, take a note username and password for jenkins
- login to jenkins via ssh and swicth to root user and stop the jenkins service
$ sudo -i
$ systemctl stop jenkins
- check the size of jenkins directory located in /var/lib
$ du -sh jenkins //shows jenkins directory
$ du -sh * //shows all the directory

#### Clean unnecessary files
- delete all files in /var/lib/jenkins/.m2/repository
- delete all files in /var/lib/jenkins/workspace
- go to /var/lib/jenkins/jobs/<your project> find your artifact and delete them
- keep plugins and tools

#### Archieve and copy to s3 bucket
- go to /var/lib
- tar -czvf <give a name (backup-jenkins.tar.gz)> jenkins
- install awscli
 $ apt update && apt install awscli -y
- copy to s3
- aws s3 cp backup-jenkins.tar.gz s3://<your bucket name>
- 



