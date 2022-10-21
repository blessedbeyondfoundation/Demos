provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}
module "azurerm_resource_group" {
  source              = "github.com/Radical-Dave/Auto/data/providers/tf/templates/azurerm/azurerm_resource_group"
  resource_group_name = var.resource_group_name
  location            = var.location
}