resource "azurerm_linux_virtual_machine" "az104-vm0" {
  name                = "az104-06-vm0"
  location           = azurerm_resource_group.az104-06.location
  resource_group_name = azurerm_resource_group.az104-06.name
  size                 = "Standard_DS1_v2"
  admin_username       = "myadminusername"
  disable_password_authentication = true
  network_interface_ids = [azurerm_network_interface.vm00.id]

  os_disk {
    name              = "myosdisk"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  ssh_key {
  key_data      = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDHiBXSqnB0ApgyG2M2n6SxJd9alb8MTKVI/dd834eQV/rdMlw2nXEvoreMqBQFc1K09xbzWWldDLBAROHhRxbO4hACt8X1OPRkswyLHH+im6ee9/k3CIxvOO/PqQ9JLDx/ig4WgLud8QnxT8nu893yl3lJMO+XhXh+7pbaL69zsLi1ZfxGo6pbGhZV6xTzILk/WParqkzDc3/s5FsGYej7oaacs65zm2hugatbASJJpwOBypcIUpyehdACVu8VAHWMIaGYIuplFS1v2a3Vg0INCyJS/X8BG768ov7Q43x/tqUM3weaRlilPWAL3u3XZsRgRXOmOfUvZQoKO1ZJfLLuG/HpUzDMWKPcp1YqV3JChbZVQACx/AeJxGyUeGepv2EbvgIwu2B3ONntW7qXVK+ck1Kx8ZQUhotM/FcHSNPmxrToQKYA9Ytu4CsD5pFPlOAIaYzXgRbfg7ZZNuuKir/teUB+4fZqH9p6KaYg1fkGLfE5F+u4k+rmTEd90XQ5qc7N7LwCcAGJtg1Zd+QBVqcXTyJmyUDJMbgwMI/RZIO46cNJbwiNE2F+JJvAEz+InyQa7RR+z684jq8P54RbszGmMotzprECvc1/aLC1zB6Gf/JrjFotyWo/qLAL0Ue2u+1IO91F+3iWgNaLZ43KPe/djcjAqAteoZzScRK+jIxlCw== brunosantosc1@gmail.com"
  path          = "/home/myadminusername/.ssh/authorized_keys"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  tags = {
    environment = "frontend"
  }
}