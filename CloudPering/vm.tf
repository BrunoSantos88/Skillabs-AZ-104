resource "azurerm_linux_virtual_machine" "az-104-vm0" {
    name                  = "az104-vm0"
     location            = azurerm_resource_group.bastion.id
     resource_group_name = azurerm_resource_group.bastion.id
    network_interface_ids = [azurerm_network_interface.bastion.id]
    size                  = "Standard_DS1_v2"

    os_disk {
        name              = "az104-disk0"
        caching           = "ReadWrite"
        storage_account_type = "Premium_LRS"
    }

    source_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
    }

    computer_name  = "bastionhost"
    admin_username = "azureuser"
    disable_password_authentication = true

    admin_ssh_key {
        username       = "azureuser"
        public_key     = azurerm_ssh_public_key.chave_ssh.id
    }



    tags = {
        environment = "bastion"
    }
}
