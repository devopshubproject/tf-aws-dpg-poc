# tf-aws-dpg-poc

# Terraform Infrastructure Provisioning

## Overview

This project uses Terraform to provision infrastructure on AWS. It sets up a Virtual Private Cloud (VPC) with public and private subnets, deploys EC2 instances on private subnet and runs a web server, and configures auto scaling for demand-based workload.The web server displays the hostname of the instance that received the request.

The project aims to provide a flexible and scalable infrastructure for hosting web applications while maintaining security through a private subnet for instances.


## Prerequisites

Before you begin, ensure you have the following prerequisites:

1. **Terraform**: Make sure you have Terraform 1.0.0 or a later version installed on your machine. You can download it [here](https://www.terraform.io/downloads.html).

2. **AWS Account**: You need an AWS account with appropriate permissions. Configure your AWS CLI with your access key and secret key.

## Project Structure
The project structure includes the following components:

Terraform Configuration Files: The .tf files that define the infrastructure, including VPC, subnets, EC2 instances, security groups, auto scaling, and other AWS resources.

README.md: This document that provides an overview of the project, prerequisites, and instructions for usage.

variables.tf: Defines the input variables for the Terraform configuration, allowing you to customize the infrastructure.

main.tf: The main Terraform configuration file that defines the AWS resources and their properties.

dev.tfvars: Env specific variable file that you can customize with your own values.

web_server.py: A sample Python script that runs on EC2 instances in the private subnet and displays the hostname in response to HTTP requests.

## Getting Started

1. Clone this repository to your local machine:

   ```bash
   git clone <repository_url>
   cd terraform-infrastructure
   ```
Create a .tfvars file (e.g., dev.tfvars) to set your variable values. Here's an example .tfvars file:

```
<!-- hcl -->

# General
environment = "dev"

# Tags
owner = "Prem Kumar"
company = "Ladvik Solutions"
app_name = "DevOpsHub"

# Core
account = "1234567890" # Replace with your AWS account number
region = "us-west-2"   # Replace with your desired AWS region

# Networking
vpc_cidr = "10.0.0.0/16"
pub_subnet_cidr = "10.0.1.0/24"
pvt_subnet_cidr = "10.0.2.0/24"
availability_zones = ["us-west-2a", "us-west-2b", "us-west-2c"]

# Load Balancer
health_check_path = "/health"
amis = {
  us-west-2 = "ami-0123456789"
}
instance_type = "t2.nano"

# Auto Scaling
autoscale_min = 1
autoscale_max = 3
autoscale_desired = 2
```

___Initialize Terraform:___

```bash
terraform init
```

___Review the Terraform plan:___

```bash
terraform plan -var-file="terraform.tfvars"
```

___Apply the Terraform configuration:___

```bash
terraform apply -var-file="terraform.tfvars"
```

*___Confirm the changes when prompted.___*

Customization:

You can customize the dev.tfvars file to match your specific requirements, including AWS region, instance types, and other settings.

Web Server:

The web server running on EC2 instances in the private subnet responds to HTTP requests by displaying the hostname of the instance that received the request. You can further customize the web server logic in the web_server.py file.

Cleanup:

When you're done with the infrastructure, you can destroy it by running:

```bash
terraform destroy -var-file="terraform.tfvars"
```

> Additional Resources:

- [Terraform Documentation](https://www.terraform.io/docs/index.html)

- [AWS CLI Configuration](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html)


## License

This project is licensed under the [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0) - see the LICENSE file for details.

Please replace `https://github.com/devopshubproject/tf-aws-dpg-poc` with the URL of your Git repository if you have one. This README provides a comprehensive guide to your Terraform project and can be extended or modified as needed.



## <font color = "red"> Follow-Me </font>

[![Portfolio](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/premkumar-palanichamy)

<p align="left">
<a href="https://linkedin.com/in/premkumarpalanichamy" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/linked-in-alt.svg" alt="premkumarpalanichamy" height="25" width="25" /></a>
</p>

[![youtube](https://img.shields.io/badge/YouTube-FF0000?style=for-the-badge&logo=youtube&logoColor=white)](https://www.youtube.com/channel/UCJKEn6HeAxRNirDMBwFfi3w)