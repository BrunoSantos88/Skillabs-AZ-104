#pering global
resource "azurerm_virtual_network_peering" "vnet0_to_vnet1" {
  name                         = "vnet0-to-bastion"
  resource_group_name          = azurerm_resource_group.az104-05.name
  virtual_network_name         = azurerm_virtual_network.vnet0.name
  remote_virtual_network_id    = azurerm_virtual_network.vnet1.id
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "vnet0_to_vnet2" {
  name                         = "vnet0-to-bastion"
  resource_group_name          = azurerm_resource_group.az104-05.name
  virtual_network_name         = azurerm_virtual_network.vnet0.name
  remote_virtual_network_id    = azurerm_virtual_network.vnet2.id
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "vnet1_to_vnet2" {
  name                         = "vnet0-to-bastion"
  resource_group_name          = azurerm_resource_group.az104-05.name
  virtual_network_name         = azurerm_virtual_network.vnet1.name
  remote_virtual_network_id    = azurerm_virtual_network.vnet2.id
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
  use_remote_gateways          = false
}

