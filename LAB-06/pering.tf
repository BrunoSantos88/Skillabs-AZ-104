resource "azurerm_virtual_network_peering" "vnet-01-vnet-02" {
  name                      = "peer1to2"
  resource_group_name       = var.resource_group_name_az104-06-rg1
  virtual_network_name      = azurerm_virtual_network.az104-06-venet01.id
  remote_virtual_network_id = azurerm_virtual_network.az104-06-vnet02.id
}

resource "azurerm_virtual_network_peering" "vnet-02-vnet-01" {
  name                      = "peer2to1"
  resource_group_name       = var.resource_group_name_az104-06-rg1
  virtual_network_name      = azurerm_virtual_network.az104-06-vnet02.id
  remote_virtual_network_id = azurerm_virtual_network.az104-06-venet01.id
}

resource "azurerm_virtual_network_peering" "vnet-03-vnet-01" {
  name                      = "peer3to1"
  resource_group_name       = var.resource_group_name_az104-06-rg1
  virtual_network_name      = azurerm_virtual_network.az104-06-vnet03.id
  remote_virtual_network_id = azurerm_virtual_network.az104-06-venet01.id
}