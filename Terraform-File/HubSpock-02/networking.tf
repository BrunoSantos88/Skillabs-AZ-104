resource "azurerm_virtual_network" "vnet1" {
  name                = "az104-06-vnet01"
  address_space       = ["10.60.0.0/22"]
  location            = azurerm_resource_group.az104-06.location
  resource_group_name = azurerm_resource_group.az104-06.name
}

resource "azurerm_virtual_network" "vnet2" {
  name                = "az104-06-vnet02"
  address_space       = ["10.62.0.0/22"]
  location           = azurerm_resource_group.az104-06.location
  resource_group_name = azurerm_resource_group.az104-06.name
}

resource "azurerm_virtual_network" "vnet3" {
  name                = "az104-06-vnet03"
  address_space       = ["10.63.0.0/22"]
  location           = azurerm_resource_group.az104-06.location
  resource_group_name = azurerm_resource_group.az104-06.name
}

resource "azurerm_subnet" "subnet0" {
  name                 = "subnet0"
  resource_group_name = azurerm_resource_group.az104-06.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.60.0.0/24"]
}

resource "azurerm_subnet" "subnet1" {
  name                 = "subnet1"
  resource_group_name = azurerm_resource_group.az104-06.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.60.1.0/24"]
}

resource "azurerm_subnet" "subnet2" {
  name                 = "subnet0"
  resource_group_name = azurerm_resource_group.az104-06.name
  virtual_network_name = azurerm_virtual_network.vnet2.name
  address_prefixes     = ["10.62.0.0/24"]
}

resource "azurerm_subnet" "subnet3" {
  name                 = "subnet0"
  resource_group_name = azurerm_resource_group.az104-06.name
  virtual_network_name = azurerm_virtual_network.vnet3.name
  address_prefixes     = ["10.63.0.0/24"]
   #endpoint caso queira endpoint
  service_endpoints = ["Microsoft.Sql"]
}