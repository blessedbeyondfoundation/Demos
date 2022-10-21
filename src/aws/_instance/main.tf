data "aws_availability_zones" "available" {
  state = "available"
}
module "_instance" {
  source              = "github.com/Radical-Dave/Auto/data/providers/tf/templates/azurerm/azurerm_resource_group"
  resource_group_name = var.resource_group_name
  location            = var.location
}