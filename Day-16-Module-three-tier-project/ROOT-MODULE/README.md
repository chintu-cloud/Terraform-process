# ==== Module-Three-Tier ====
Terraform AWS Multi-Tier Architecture — Full Project Documentation 📌 Overview

This Terraform project deploys a production-ready 3-Tier AWS Architecture using modules:

Tier-1 (Networking Layer)

VPC

2 Public Subnets

2 Private Web Subnets

2 Private App Subnets

2 Private Database Subnets

Internet Gateway

NAT Gateways

Route Tables & Associations

Tier-2 (Security Layer)

Security Groups for:

Bastion Host

Web Tier

App Tier

Database Tier

Tier-3 (Compute + Database Layer)

Bastion EC2 instance (Public Subnet)

Web & App EC2 instances (Private Subnets)

RDS MySQL (Private DB Subnets)

Everything is modularized for easy reuse & scalability.

🚀 Project Structure

terraform/ │── main.tf │── variables.tf │── outputs.tf │── terraform.tfvars │── README.md │ ├── modules/ │ ├── vpc/ │ │ ├── main.tf │ │ ├── variables.tf │ │ ├── outputs.tf │ │ │ ├── security/ │ │ ├── main.tf │ │ ├── variables.tf │ │ ├── outputs.tf │ │ │ ├── ec2/ │ │ ├── main.tf │ │ ├── variables.tf │ │ ├── outputs.tf │ │ │ ├── rds/ │ ├── main.tf │ ├── variables.tf │ ├── outputs.tf

               Internet
                    |
            ┌────────────────┐
            │  Frontend ALB  │
            └────────────────┘
               /           \
   Public Subnet 1      Public Subnet 2
       |                      |
 Frontend ASG (EC2)     Frontend ASG (EC2)
       |
       └──────── routes to Backend ALB ───────┐
                                               |
                                     ┌────────────────┐
                                     │  Backend ALB   │
                                     └────────────────┘
                                      /             \
                           Private App Subnet 1   Private App Subnet 2
                              |                       |
                       Backend ASG (EC2)        Backend ASG (EC2)
                              |
                              └────── connects to RDS ───────┐
                                                               |
                                                        ┌───────────────┐
                                                        │   RDS MySQL   │
                                                        └───────────────┘

# 1.Create rds database into private subnets
# 2.Create two private  servers in private subnets one is for frontend and another one is for backend
# 3.Create two TG and loadbalncers one is for frontend another one is for backend 
# 4.Create both loadblancers in public subnets only and loadbalancer type s internet facing only becuser internal loadbalncer not working for our project 

# ->>connect to backend server--

# 1. git clone https://github.com/CloudTechDevOps/2nd10WeeksofCloudOps-main.git
#   cd backend 
# 2. edit the .env file in bellow path if u dont have any .env file just create in below path

# 3. 2nd10WeeksofCloudOps-main.git/backend/.env

### add this mater
# DB_HOST=book.rds.com	#change rds endpoint
# DB_USERNAME=admin	#cahnge to nyour rds user name 
# DB_PASSWORD="veera"   # change to your rds password
# PORT=3306

# yum install mariadb105-server

# SSH into backend server and then run test.sql script from backend to create tables and records 

# mysql -h book.rds.com -u admin -p<password> < test.sql


### Backend deploy process ###

# sudo dnf install -y nodejs

# CD backend

# npm install

# npm install -g pm2

# pm2 start index.js --name node-app

#### after that create backend tg and loadbalncer and check your loadbalncer is giving hello response or not 


# ---------------------------------- FrontEnd---------------------------------------

# -------Step-1-------install dependencies ------
 ### Frontend deploy process ###
# git clone https://github.com/CloudTechDevOps/2nd10WeeksofCloudOps-main.git
   
# checkout client cd client 

# edit the config.js

# vi client/src/pages/config.js
  
# const API_BASE_URL = "http://api.narni.co.in";
 
# in above line change to your backend loadbalncer url
# const API_BASE_URL = "http://backend-loadbalancer-url";

# sudo dnf install -y nodejs
# sudo yum install httpd
# sudo systemctl start httpd
# sudo systemctl enable httpd

# 12. then go to client directory 
# 13.run below commands

# ****(Use npm run build:
# When preparing the app for deployment (e.g., to a server or hosting service like AWS, Netlify, or Vercel).
# Use npm start:
# During development or to start the app in production (for backend apps).)*****

# npm install 
# npm run build
# sudo cp -r build/* /var/www/html

# your frontend part is completed 

### #### after that create frontend tg and loadbalncer and check your loadbalncer is giving project output along with books 
# 28. add the books 
