resource "azurerm_linux_virtual_machine" "myterraformvm" {
    name                  = "myVM"
    location           = azurerm_resource_group.az104-06.location
    resource_group_name = azurerm_resource_group.az104-06.name
    network_interface_ids = [azurerm_network_interface.vm00.id]
    size                  = "Standard_DS1_v2"

    os_disk {
        name              = "myOsDisk"
        caching           = "ReadWrite"
        storage_account_type = "Premium_LRS"
    }

    source_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
    }

    computer_name  = "myvm"
    admin_username = "azureuser"
    disable_password_authentication = true

    admin_ssh_key {
        username       = "azureuser"
        public_key     = file("~/.ssh/id_rsa.pub")
    }


    tags = {
        environment = "Terraform Demo"
    }
}