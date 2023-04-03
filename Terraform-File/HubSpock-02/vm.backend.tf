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
        public_key     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDHiBXSqnB0ApgyG2M2n6SxJd9alb8MTKVI/dd834eQV/rdMlw2nXEvoreMqBQFc1K09xbzWWldDLBAROHhRxbO4hACt8X1OPRkswyLHH+im6ee9/k3CIxvOO/PqQ9JLDx/ig4WgLud8QnxT8nu893yl3lJMO+XhXh+7pbaL69zsLi1ZfxGo6pbGhZV6xTzILk/WParqkzDc3/s5FsGYej7oaacs65zm2hugatbASJJpwOBypcIUpyehdACVu8VAHWMIaGYIuplFS1v2a3Vg0INCyJS/X8BG768ov7Q43x/tqUM3weaRlilPWAL3u3XZsRgRXOmOfUvZQoKO1ZJfLLuG/HpUzDMWKPcp1YqV3JChbZVQACx/AeJxGyUeGepv2EbvgIwu2B3ONntW7qXVK+ck1Kx8ZQUhotM/FcHSNPmxrToQKYA9Ytu4CsD5pFPlOAIaYzXgRbfg7ZZNuuKir/teUB+4fZqH9p6KaYg1fkGLfE5F+u4k+rmTEd90XQ5qc7N7LwCcAGJtg1Zd+QBVqcXTyJmyUDJMbgwMI/RZIO46cNJbwiNE2F+JJvAEz+InyQa7RR+z684jq8P54RbszGmMotzprECvc1/aLC1zB6Gf/JrjFotyWo/qLAL0Ue2u+1IO91F+3iWgNaLZ43KPe/djcjAqAteoZzScRK+jIxlCw== brunosantosc1@gmail.com"
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