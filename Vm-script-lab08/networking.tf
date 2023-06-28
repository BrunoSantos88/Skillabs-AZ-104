resource "azurerm_virtual_network" "vnet1" {
  name                = "az104-08-vnet01"
  address_space       = ["10.80.0.0/22"]
  location            = azurerm_resource_group.az104-08.location
  resource_group_name = azurerm_resource_group.az104-08.name
}


resource "azurerm_subnet" "subnet0" {
  name                 = "subnet0"
  location           = azurerm_resource_group.az104-08.location
  resource_group_name = azurerm_resource_group.az104-08.name
  address_prefixes     = ["10.80.0.0/24"]
}

resource "azurerm_subnet" "subnet1" {
  name                 = "subnet1"
  resource_group_name = azurerm_resource_group.az104-08.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.80.1.0/24"]
}