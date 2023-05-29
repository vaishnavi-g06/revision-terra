resource "azurerm_virtual_network" "azure-vn" {
  name                = "azure-vn"
  location            = azurerm_resource_group.demo.location
  resource_group_name = azurerm_resource_group.demo.name
  tags = {
    environment = "dev"
  }
  address_space = ["10.0.0.0/24"]
}