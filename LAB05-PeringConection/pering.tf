#pering global
resource "azurerm_virtual_network_peering" "vnet1_to_vnet2" {
  name                         = "vnet0-to-vnet2"
  resource_group_name          = azurerm_resource_group.az104-05.name
  virtual_network_name         = azurerm_virtual_network.vnet0.name
  remote_virtual_network_id    = azurerm_virtual_network.vnet2.id
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "vnet1_to_vnet3" {
  name                         = "vnet1-to-vnet2"
  resource_group_name          = azurerm_resource_group.az104-05.name
  virtual_network_name         = azurerm_virtual_network.vnet1.name
  remote_virtual_network_id    = azurerm_virtual_network.vnet2.id
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
  use_remote_gateways          = false
}


#Pering Local
resource "azurerm_virtual_network_peering" "peering" {
  name                      = "local-peering"
  resource_group_name       = azurerm_resource_group.az104-05.name
  virtual_network_name      = azurerm_virtual_network.vnet1.name
  remote_virtual_network_id = azurerm_virtual_network.vnet2.id
  allow_virtual_network_access = true
  allow_forwarded_traffic  = true
  allow_gateway_transit    = false
  use_remote_gateways      = false
  peering_location         = "East US"
}
