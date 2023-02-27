# Continuous Integration on AWS Cloud
Region = North Virginia (us-east-1)
# AWS CodeCommit Setup
- CodeCommit - Create Repository - 
- Create IAM User to connect the repository - programmatic access: true - Attach Policy - create Policy - 
- code commit - resources - add ARN - create policy - Attach new policy - create user
- delete access key you dont need it
- we need ssh key so create key on your terminal. 
- Upload SSH public key
- create SSH Config file

## AWS CodeArtifact Setup and AWS System Manager Parameter store
- CodeArtifact - Create Repository - public upstream: 
maven-central-repo - this account - domain name: - create 
- goto maven-central-store - view conn.. - mvn - 
- create iam user - name: - download credentials
- aws configure
- export token
- update setting.xml and pom.xml 

## SonarCloud Setup
- goto sonarcloud.io - login with your github account - genarete token name: 
hit + - analyze new project - create a project manually - 

## AWS System Manager Parameter Store for Sonar Details
- goto ssm service on AWS - Parameter store - create parameters -
- HOST - Organization - Project - token one for sonar one for artifact -