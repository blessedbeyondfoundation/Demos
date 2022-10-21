terraform {
  required_version = ">=0.14"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "base-terraform-rg"
    storage_account_name = "baseterraformsa"
    container_name       = "smoke-test-terraform"
    key                  = "smoke-test-terraform.tfstate"
  }
}