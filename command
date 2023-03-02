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

### Nexus back up (Amazon Linux)
- login to Nexus server via ssh and swicth to root user and stop the nexus service
$ sudo -i
$ systemctl stop nexus
- go to /opt
 $ tar -czvf <give a name (backup-nexus.tgz)> nexus
- install awscli
 $ aws s3 cp backup-nexus.tgz s3://<your bucket name>

### SonarQube Server (ubuntu-bionic-18.04)
- login to SonarQube server via ssh and swicth to root 
user and stop the nexus service
$ sudo -i
$ systemctl stop sonarqube
- go to /opt
 $ tar -czvf <give a name (backup-sonarqube.tgz)> sonarqube
- install awscli
 $ aws s3 cp backup-sonarqube.tgz s3://<your bucket name>

### Tomcat Server (ubuntu)
- login to Tomcat server via ssh and swicth to root 
user
 $ sudo -i
- install awscli
- go to /usr/local/tomcat8/conf and copy tomcat-users.xml to s3 bucket
 $ aws s3 cp tomcat-users.xml s3://<your bucket name>
- go to /usr/local/tomcat8//webapps/manager/META-INF and copy context.xml to s3 bucket
 $ aws s3 cp context.xml s3://<your bucket name>
- check your s3 bucket
 $ aws s3 ls s3://<your bucket name>

## Restore Jenkins server manually

- Launch EC2 instance and finish installation steps until first login step on browser
- login to jenkins via ssh and swicth to root user and stop the jenkins service
$ sudo -i
$ systemctl stop jenkins
- go to /var/lib
- keep in my ownerships of jenkins directory is jenkins
- goto AWS console
- on EC2 Dashboard select your new instance --> Actions --> Instance settings or 
(Security) --> Modify IAM role --> select the role that you created for S3 bucket and save 
- back to terminal on new jenkins server
- install awscli
- copy the backup files from s3 bucket 
 $ aws s3 cp s3://<your bucket name>/<backup file name> . //this directory (/var/lib)
- extract the file it override the current files
 $ tar xzvf <backup file name>
- check the permissions if it is not suitable then run below command
 $ chown jenkins.jenkins jenkins -R
- start the service
 $ systemctl start jenkins 
- login to jenkins with your previous username and password
