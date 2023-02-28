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
Host git-codecommit.*.amazonaws.com
  User <SSH KEY ID>
  IdentityFile ~/.ssh/<private key file name>
- chmod 600 config
- verify the connection - use -v option fro details 
ssh git-codecommit.us-east-2.amazonaws.com
- goto tmp directory and clone the repo for test purpose
git clone ssh://git-codecommit.us-east-1.amazonaws.com/v1/repos/<repo name>
- get the source code
git clone https://github.com/devopshydclub/vprofile-project.git
cat .git/config
- update remote
git branch -a
git checkout master
git branch -a | grep -v HEAD | cut -d '/' -f3 | grep -v master
$ git branch -a | grep -v HEAD | cut -d '/' -f3 | grep -v master > /tmp/branches
$ cat /tmp/branches 
$ for i in $(cat /tmp/branches) ; do echo $i ; done  
or
$ for i in `cat /tmp/branches` ; do echo $i ; done
$ for i in `cat /tmp/branches` ; do git checkout $i ; done
$ git branch -a
$ git fetch --tags
$ git remote rm origin
$ git remote add origin <ssh:repos ssh adress>
$ cat .git/config
$ git push origin --all
- check the repo and see the source

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