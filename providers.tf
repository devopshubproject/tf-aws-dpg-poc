##################################################
# Providers
##################################################

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.18.1, < 6.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

data "aws_region" "region" {}

data "aws_availability_zones" "az" {}
