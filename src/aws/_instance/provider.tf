terraform {
  required_version = ">=0.14"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  #  backend "aws" {
  #    resource_group_name  = "base-terraform-rg"
  #    storage_account_name = "baseterraformsa"
  #    container_name       = "smoke-test-terraform"
  #    key                  = "smoke-test-terraform.tfstate"
  #  }
}
provider "aws" {
  region = var.region
  #version="~> 2.36.0"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}