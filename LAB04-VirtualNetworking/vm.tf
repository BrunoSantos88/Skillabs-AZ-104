resource "azurerm_linux_virtual_machine" "az-104-vm0" {
    name                  = "az104-vm0"
    location           = azurerm_resource_group.az104-04.location
    resource_group_name = azurerm_resource_group.az104-04.name
    network_interface_ids = [azurerm_network_interface.vm00.id]
    size                  = "Standard_DS1_v2"
    computer_name  = "az104-vm0"
    admin_username = "azureuser"
    disable_password_authentication = true


    admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
    }

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
     
    tags = {
        environment = "VM0"
    }
}

resource "azurerm_linux_virtual_machine" "az-104-vm0" {
    name                  = "az104-vm0"
    location           = azurerm_resource_group.az104-04.location
    resource_group_name = azurerm_resource_group.az104-04.name
    network_interface_ids = [azurerm_network_interface.vm01.id]
    size                  = "Standard_DS1_v2"
    computer_name  = "az104-vm0"
    admin_username = "azureuser"
    disable_password_authentication = true


    admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
    }

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
     
    tags = {
        environment = "VM1"
    }
}

