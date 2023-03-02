# Backup and Restore 
- The back up process of Jenkins, Nexus, SonarQube, Tomcat and restore Jenkins from back up on AWS (EC2 instances)

## Backup
- create s3 bucket. choose the region you usually use
- create iam role for ec2 instance and attach policy AmazonS3FullAccess or create 
your own restericted policy and attach it to iam role.
- attach the role to all instances you want to back up. 
- on EC2 Dashboard select your instance --> Actions --> Instance settings or 
(Security) --> Modify IAM role --> select the role and save

### Jenkins back up
- keep in mind, take a note username and password for jenkins




