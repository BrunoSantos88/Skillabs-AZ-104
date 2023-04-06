resource "azurerm_public_ip" "mypublicip0" {
  name                = "my-public-ip0"
  location            = azurerm_resource_group.az104-04.location
  resource_group_name = azurerm_resource_group.az104-04.name
  allocation_method   = "Dynamic"
  ip_version          = "IPv4"
}

resource "azurerm_public_ip" "mypublicip1" {
  name                = "my-public-ip1"
  location            = azurerm_resource_group.az104-04.location
  resource_group_name = azurerm_resource_group.az104-04.name
  allocation_method   = "Dynamic"
  ip_version          = "IPv4"
}