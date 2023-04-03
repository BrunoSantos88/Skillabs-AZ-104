resource "azurerm_virtual_network" "vnet0" {
  name                = "az104-05-vnet00"
  address_space       = ["10.50.0.0/22"]
  location            = azurerm_resource_group.az104-05.location
  resource_group_name = azurerm_resource_group.az104-05.name
}

resource "azurerm_virtual_network" "vnet1" {
  name                = "az104-05-vnet01"
  address_space       = ["10.51.0.0/22"]
  location           = azurerm_resource_group.az104-05.location
  resource_group_name = azurerm_resource_group.az104-05.name
}

resource "azurerm_virtual_network" "vnet2" {
  name                = "az104-05-vnet02"
  address_space       = ["10.52.0.0/22"]
  location           = azurerm_resource_group.az104-05.location
  resource_group_name = azurerm_resource_group.az104-05.name
}

resource "azurerm_subnet" "subnet0" {
  name                 = "subnet0"
  resource_group_name = azurerm_resource_group.az104-05.name
  virtual_network_name = azurerm_virtual_network.vnet0.name
  address_prefixes     = ["10.50.0.0/24"]
}


resource "azurerm_subnet" "subnet1" {
  name                 = "subnet0"
  resource_group_name = azurerm_resource_group.az104-05.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.51.0.0/24"]
}

resource "azurerm_subnet" "subnet3" {
  name                 = "subnet0"
  resource_group_name = azurerm_resource_group.az104-05.name
  virtual_network_name = azurerm_virtual_network.vnet2.name
  address_prefixes     = ["10.52.0.0/24"]
}