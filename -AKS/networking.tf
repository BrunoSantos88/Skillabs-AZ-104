resource "azurerm_virtual_network" "vnet1" {
  name                = "az104-09-jenkins"
  address_space       = ["10.60.0.0/22"]
  location            = var.location
  resource_group_name = var.resoucegroup
}

resource "azurerm_subnet" "subnet0" {
  name                 = "subnet0"
  resource_group_name = var.resoucegroup
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.60.0.0/24"]
}

