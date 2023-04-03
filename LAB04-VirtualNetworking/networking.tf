resource "azurerm_virtual_network" "example" {
  name                = "az104-04-vnet0"
  address_space       = ["10.40.0.0/20"]
  location            = azurerm_resource_group.az104-04.location
  resource_group_name = azurerm_resource_group.az104-04.name
}

resource "azurerm_subnet" "subnet1" {
  name                 = "subnet0"
  resource_group_name  = azurerm_resource_group.az104-04.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.40.0.0/24"]
}

resource "azurerm_subnet" "subnet2" {
  name                 = "subnet1"
  resource_group_name  = azurerm_resource_group.az104-04.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.40.1.0/24"]
}


