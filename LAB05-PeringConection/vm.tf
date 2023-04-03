resource "azurerm_linux_virtual_machine" "az-104-vm0" {
    name                  = "az104-vm0"
    location           = azurerm_resource_group.az104-05.location
    resource_group_name = azurerm_resource_group.az104-05.name
    network_interface_ids = [azurerm_network_interface.vm00.id]
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

    computer_name  = "az104-vm0"
    admin_username = "azureuser"
    disable_password_authentication = true

    admin_ssh_key {
        username       = "azureuser"
        public_key     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDHiBXSqnB0ApgyG2M2n6SxJd9alb8MTKVI/dd834eQV/rdMlw2nXEvoreMqBQFc1K09xbzWWldDLBAROHhRxbO4hACt8X1OPRkswyLHH+im6ee9/k3CIxvOO/PqQ9JLDx/ig4WgLud8QnxT8nu893yl3lJMO+XhXh+7pbaL69zsLi1ZfxGo6pbGhZV6xTzILk/WParqkzDc3/s5FsGYej7oaacs65zm2hugatbASJJpwOBypcIUpyehdACVu8VAHWMIaGYIuplFS1v2a3Vg0INCyJS/X8BG768ov7Q43x/tqUM3weaRlilPWAL3u3XZsRgRXOmOfUvZQoKO1ZJfLLuG/HpUzDMWKPcp1YqV3JChbZVQACx/AeJxGyUeGepv2EbvgIwu2B3ONntW7qXVK+ck1Kx8ZQUhotM/FcHSNPmxrToQKYA9Ytu4CsD5pFPlOAIaYzXgRbfg7ZZNuuKir/teUB+4fZqH9p6KaYg1fkGLfE5F+u4k+rmTEd90XQ5qc7N7LwCcAGJtg1Zd+QBVqcXTyJmyUDJMbgwMI/RZIO46cNJbwiNE2F+JJvAEz+InyQa7RR+z684jq8P54RbszGmMotzprECvc1/aLC1zB6Gf/JrjFotyWo/qLAL0Ue2u+1IO91F+3iWgNaLZ43KPe/djcjAqAteoZzScRK+jIxlCw== brunosantosc1@gmail.com"
    }


    tags = {
        environment = "VM0"
    }
}

resource "azurerm_linux_virtual_machine" "az-104-vm1" {
    name                  = "az104-vm1"
    location           = azurerm_resource_group.az104-05.location
    resource_group_name = azurerm_resource_group.az104-05.name
    network_interface_ids = [azurerm_network_interface.vm01.id]
    size                  = "Standard_DS1_v2"

    os_disk {
        name              = "az104-disk1"
        caching           = "ReadWrite"
        storage_account_type = "Premium_LRS"
    }

    source_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
    }

    computer_name  = "az104-vm1"
    admin_username = "azureuser"
    disable_password_authentication = true

    admin_ssh_key {
        username       = "azureuser"
        public_key     = "*"
    }


    tags = {
        environment = "VM1"
    }
}

resource "azurerm_linux_virtual_machine" "az-104-vm2" {
    name                  = "az104-vm2"
    location           = azurerm_resource_group.az104-05.location
    resource_group_name = azurerm_resource_group.az104-05.name
    network_interface_ids = [azurerm_network_interface.vm00.id]
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
        public_key     = ""
    }


    tags = {
        environment = "VM2"
    }
}




