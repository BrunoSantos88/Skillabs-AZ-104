resource "azurerm_linux_virtual_machine" "jenkins-vm" {
    name                  = "jenkins-vm"
    location            = var.location
    resource_group_name = var.resoucegroup
    network_interface_ids = [azurerm_network_interface.jenkinVm.id]
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

    computer_name  = "jenkins"
    admin_username = "azureuser"
    disable_password_authentication = true

    admin_ssh_key {
        username       = "azureuser"
        public_key          = file("~/.ssh/id_rsa.pub")
    }



    tags = {
        environment = "JenkinServer"
    }
}