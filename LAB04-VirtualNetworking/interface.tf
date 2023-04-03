# interface de Rede VM
resource "azurerm_network_interface" "vm00" {
  name                = "vm0nic"
  location            = azurerm_resource_group.az104-04.location
  resource_group_name = azurerm_resource_group.az104-04.name
  enable_ip_forwarding = true

ip_configuration {
    name                          = "vm0nic"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.40.0.4"
    }

    tags = {
    environment = "az106-04-vm0"
    }
}


resource "azurerm_network_interface" "vm01" {
  name                = "vm1nic"
 location            = azurerm_resource_group.az104-04.location
 resource_group_name = azurerm_resource_group.az104-04.name
  enable_ip_forwarding = true

   ip_configuration {
    name                          = "vm0nic"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.40.1.4"
    }

    tags = {
    environment = "az106-04-vm1"
    }
}
