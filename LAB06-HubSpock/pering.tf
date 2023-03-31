resource "azurerm_virtual_network_peering" "vnet1_to_vnet2" {
  name                         = "vnet1-to-vnet2"
  resource_group_name          = var.resoucegroup
  virtual_network_name         = azurerm_virtual_network.vnet1.name
  remote_virtual_network_id    = azurerm_virtual_network.vnet3.name
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "vnet1_to_vnet3" {
  name                         = "vnet1-to-vnet2"
  resource_group_name          = var.resoucegroup
  virtual_network_name         = azurerm_virtual_network.vnet1.name
  remote_virtual_network_id    = azurerm_virtual_network.vnet2.name
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
}