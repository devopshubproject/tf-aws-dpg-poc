###### General ######

variable "environment" {
  type        = "string"
  description = "The environment name"
}

variable "location" {
  type        = "string"
  description = "The Location for Infra centre"
  default     = "northeurope"
}

#### Tags ####

variable "owner" {
  type        = string
  description = "The name of the infra provisioner or owner"
  default     = "Prem"
}
variable "company" {
  type        = string
  description = "The cost_center name for this porject"
  default     = "DevOpsHub"
}
variable "app_name" {
  type        = string
  description = "Application name of the project"
  default     = "automation"
}

variable "cost_center" {
  
}

#### VM Details ####
variable "vm_size" {
  type        = string
  description = "The Size for vm resource"
}

# core

variable "account" {
  description = "The AWS Account Number (10 digit) to create resources in."
  #default     = "1234567890" # Replace with account number or input on the terminal
}

variable "region" {
  description = "The AWS region to create resources in."
  default     = "us-east-2"
}


# networking

variable "vpc_cidr" {
  description = "CIDR Block for VPC"
}
variable "pub_subnet_cidr" {
  description = "CIDR Block for Public Subnet 1"
  default     = "10.0.1.0/24"
}

variable "pvt_subnet_cidr" {
  description = "CIDR Block for Private Subnet 1"
  default     = "10.0.3.0/24"
}

variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
  default     = ["us-east-2a", "us-east-2b", "us-east-2c"]
}


# load balancer

variable "health_check_path" {
  description = "Health check path for the default target group"
  default     = "/"
}

variable "amis" {
  description = "Which AMI to spawn."
  default = {
    us-east-1 = "ami-05fa00d4c63e32376"
    us-east-2 = "ami-0568773882d492fc8"
  }
}
variable "instance_type" {
  default = "t2.micro"
}



# auto scaling

variable "autoscale_min" {
  description = "Minimum autoscale (number of EC2)"
  default     = "1"
}
variable "autoscale_max" {
  description = "Maximum autoscale (number of EC2)"
  default     = "2"
}
variable "autoscale_desired" {
  description = "Desired autoscale (number of EC2)"
  default     = "1"
}