resource "azurerm_virtual_network_peering" "az104-06-peering-1" {
  virtual_network_name         = azurerm_network_interface.vm00.id
  resource_group_name          ="az104-06-rg1"
  remote_virtual_network_id    = azurerm_network_interface.vm02.id
  name                         = "peers-vnet0-vnet-2"
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}

resource "azurerm_virtual_network_peering" "az104-06-peering-2" {
  virtual_network_name         = azurerm_network_interface.vm01.id
  resource_group_name          = "az104-06-rg1"
  remote_virtual_network_id    = azurerm_network_interface.vm03.id
  name                         = "peers-vnet1-vnet-3"
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}