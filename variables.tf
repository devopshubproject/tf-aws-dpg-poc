###### General ######

variable "environment" {
  type        = "string"
  description = "The environment name"
}

#### Tags ####

variable "owner" {
  type        = string
  description = "The name of the infra provisioner or owner"
}
variable "company" {
  type        = string
  description = "The cost_center name for this porject"
}
variable "app_name" {
  type        = string
  description = "Application name of the project"
}

variable "cost_center" {
  type        = string
  description = "Application Cost center of the project"
}

#### VM Details ####
variable "instance_type" {
  type        = string
  description = "The Size for vm resource"
}

# core

variable "account" {
  description = "The AWS Account Number (10 digit) to create resources in."
}

variable "region" {
  description = "The AWS region to create resources in."
}


# networking

variable "vpc_cidr" {
  description = "CIDR Block for VPC"
}
variable "pub_subnet_cidr" {
  description = "CIDR Block for Public Subnet"
}

variable "pvt_subnet_cidr" {
  description = "CIDR Block for Private Subnet"
}

variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
}


# load balancer

variable "health_check_path" {
  description = "Health check path for the default target group"
}

variable "ami" {
  description = "Which AMI to spawn."
}

# auto scaling

variable "autoscale_min" {
  description = "Minimum autoscale (number of EC2)"
}

variable "autoscale_max" {
  description = "Maximum autoscale (number of EC2)"
}

variable "autoscale_desired" {
  description = "Desired autoscale (number of EC2)"
}