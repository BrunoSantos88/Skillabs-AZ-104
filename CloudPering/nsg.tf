resource "azurerm_network_security_group" "example" {
  name                = "my-nsg"
  location            = azurerm_resource_group.az104-05.location
  resource_group_name = azurerm_resource_group.az104-05.name
}

# Create a Rule to Allow Inbound HTTP Traffic
resource "azurerm_network_security_rule" "http" {
  name                        = "http-rule"
  priority                    = 1000
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
   source_address_prefixes     = ["201.26.53.221/32"]
  destination_address_prefix  = "*"

  resource_group_name = azurerm_resource_group.az104-05.name
  network_security_group_name = azurerm_network_security_group.example.name
}


resource "azurerm_network_security_rule" "ssh" {
  name                        = "ssh-rule"
  priority                    = 1001
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
   source_address_prefixes     = ["201.26.53.221/32"]
  destination_address_prefix  = "*"

  resource_group_name = azurerm_resource_group.az104-05.name
  network_security_group_name = azurerm_network_security_group.example.name
}
# Associate the NSG with the NIC
resource "azurerm_network_interface_security_group_association" "associate0" {
  network_interface_id    = azurerm_network_interface.vm00.id
  network_security_group_id = azurerm_network_security_group.example.id
}

resource "azurerm_network_interface_security_group_association" "associate1" {
  network_interface_id    = azurerm_network_interface.vm01.id
  network_security_group_id = azurerm_network_security_group.example.id
}