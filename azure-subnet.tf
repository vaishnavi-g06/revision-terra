resource "azurerm_subnet" "subnet1" {
  name                 = "subnt-1"
  resource_group_name  = azurerm_resource_group.demo.name
  virtual_network_name = azurerm_virtual_network.azure-vn.name
  address_prefixes     = ["10.0.0.0/25"]
}