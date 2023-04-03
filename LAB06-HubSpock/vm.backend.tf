resource "azurerm_linux_virtual_machine" "az-104-vm2" {
    name                  = "az104-vm2"
    location           = azurerm_resource_group.az104-06.location
    resource_group_name = azurerm_resource_group.az104-06.name
    network_interface_ids = [azurerm_network_interface.vm02.id]
    size                  = "Standard_DS1_v2"

    os_disk {
        name                 = "az104-disk2"
        caching              = "ReadWrite"
        storage_account_type = "Premium_LRS"
        disk_size_gb         = "160"
    }

    source_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
    }

    computer_name  = "az104-vm2"
    admin_username = "azureuser"
    disable_password_authentication = true

    admin_ssh_key {
        username       = "azureuser"
        public_key     = "*"
    }


    tags = {
        environment = "Backend"
    }
}

#interface de Rede

resource "azurerm_network_interface" "vm02" {
  name                = "vm2nic"
  location            = azurerm_resource_group.az104-06.location
  resource_group_name = azurerm_resource_group.az104-06.name
  enable_ip_forwarding = true

    ip_configuration {
    name                          = "vm2nic"
    subnet_id                     = azurerm_subnet.subnet2.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.62.0.4"
    }

    tags = {
    environment = "az106-06-vm2"
    }
}