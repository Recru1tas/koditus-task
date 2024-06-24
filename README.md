# koditus-task Infrastructure branch

### This branch is used to setup infrastructure

Terrafrom and AWS account is required to setup this solution

## How to setup using Terraform:

- Clone this branch
- Create .tfvars file *(i.e. prod.tfvars)* using example.tfvars as a template with your AWS credentials
- Run the following commands:

    ```
    terraform init
    terraform plan -var-file="prod.tfvars"
    ```
    if no errors present in the plan, run:
    ```
    terraform apply -var-file="prod.tfvars"
    ```

- After terraform apply completes it outputs the loadbalancer name to reach the application. **Application runs on port 8080** so :8080 needs to be added to loadbalancer URL.

### To destroy the solution

```
terraform destroy -var-file="prod.tfvars"
```


## Architectural explanation

The containerized app is deployed on AWS Elastic Container service, specifically Fargate. It utilizes ECS autoscalling features for scalling application with cloudwatch CPU threshold alarms(although for financial reasons this was left only to min: 1 replica, max: 2 replicas. Alarm is set to Low 10%, high 80%, 60 seconds interval), uses application load balancer and target groups to route traffic. 

Cloudwatch is utilized to get application logs.

IaaC code creates everything from scratch: VPC, Subnets, Security grouops, IAM resources, ECS Cluster, Load balancer, autoscaling and etc. So this can be used on any AWS account in any region.


## Notes

1. Solution does not utilize https, did not work on that to save time, although for production application Cloudfront and TLS certificate from ACM would be desired.


2. Solution is not running permamently as it would cost a lot of money to leave it running. Instead it can be deployed in under 5 minutes whenever it is needed.
