resource "azurerm_linux_virtual_machine" "az-104-vm2" {
    name                  = "az104-vm2"
    location           = azurerm_resource_group.az104-06.location
    resource_group_name = azurerm_resource_group.az104-06.name
    network_interface_ids = [azurerm_network_interface.vm02.id]
    size                  = "Standard_DS1_v2"

    os_disk {
        name              = "az104-disk2"
        caching           = "ReadWrite"
        storage_account_type = "Premium_LRS"
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
        public_key     = azurerm_ssh_public_key.chave_ssh.id
    }


    tags = {
        environment = "VM2"
    }
}

resource "azurerm_linux_virtual_machine" "az-104-vm3" {
    name                  = "az104-vm3"
    location           = azurerm_resource_group.az104-06.location
    resource_group_name = azurerm_resource_group.az104-06.name
    network_interface_ids = [azurerm_network_interface.vm03.id]
    size                  = "Standard_DS1_v2"

    os_disk {
        name              = "az104-disk3"
        caching           = "ReadWrite"
        storage_account_type = "Premium_LRS"
    }

    source_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
    }

    computer_name  = "az104-vm3"
    admin_username = "azureuser"
    disable_password_authentication = true

    admin_ssh_key {
        username       = "azureuser"
        public_key     = azurerm_ssh_public_key.chave_ssh.id


    tags = {
        environment = "VM3"
    }
}
}