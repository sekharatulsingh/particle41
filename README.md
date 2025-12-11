# particle41



├── app
│   ├── Dockerfile
│   └── src/
│       └── simple_time_service.py
└── terraform
    ├── README.md
    ├── main.tf
    ├── vpc.tf
    ├── ecs.tf
    ├── ecs_service.tf
    ├── ecs_iam_roles.tf
    ├── alb.tf
    ├── sg_ecs_tasks.tf
    ├── variables.tf
    ├── outputs.tf
    └── terraform.tfvars




app

To run the python file
python simpletimeservice.py

Then
http://localhost:8080/

Login to docker
docker login

To Build the image 
docker build -t simpletimeservice .

Run the conatiner
docker run -p 8080:8080 simpletimeservice

Publish the image
docker tag simpletimeservice sekharatulsingh/simpletimeservice:latest

Push image
docker push sekharatulsingh/simpletimeservice:latest

Pull the image
docker pull sekharatulsingh/simpletimeservice:latest

Run
docker run -p 8080:8080 sekharatulsingh/simpletimeservice:latest



Terraform


# SimpleTimeService – Infrastructure Deployment (Terraform + AWS)

This repository contains Terraform code to deploy the SimpleTimeService container
into AWS using:

- A VPC (2 public + 2 private subnets)
- ECS Fargate cluster
- Tasks running ONLY in private subnets
- Public Application Load Balancer
- All networking, IAM roles, and security groups included

## Requirements

- Terraform >= 1.6
- AWS CLI installed
- An AWS account with permissions to deploy VPC, ECS, IAM, and ALB resources

## Authentication (VERY IMPORTANT)

No credentials are stored in this repository.

To authenticate, configure AWS credentials **locally** before running Terraform.


infra/
├── main.tf
├── vpc.tf
├── ecs.tf
├── alb.tf
├── variables.tf
├── outputs.tf
└── terraform.tfvars



For Deploying the infrastructure
cd infra
terraform init
terraform plan
terraform apply



After Deployment
terraform output load_balancer_dns


To destroy all created resources:
terraform destroy







