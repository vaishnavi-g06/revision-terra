resource "azurerm_resource_group" "demo" {
  name     = "demo"
  location = "West Europe"
  tags = {
    environment = "dev"
  }
}