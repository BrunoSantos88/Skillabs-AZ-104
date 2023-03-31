#REDE az104-06-vnet01
#CDR 10.40.0.0/20

resource "azurerm_virtual_network" "az104-06-venet01" {
  name                = "az104-06-vnet01"
  address_space       = ["10.40.0.0/20"]
  location            = var.resource_group_name_location
  resource_group_name = var.resource_group_az104-06-rg1
}

resource "azurerm_subnet" "subnet0" {
  name                 = "subnet0"
  resource_group_name  = var.resource_group_az104-06-rg1
  virtual_network_name = azurerm_virtual_network.az104-06-venet01.id
  address_prefixes     = ["10.40.0.0/24"]
}

resource "azurerm_subnet" "subnet1" {
  name                 = "subnet1"
  resource_group_name  = var.resource_group_az104-06-rg1
  virtual_network_name = azurerm_virtual_network.az104-06-venet01.id
  address_prefixes     = ["10.40.1.0/24"]
}