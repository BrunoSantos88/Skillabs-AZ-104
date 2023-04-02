resource "azurerm_linux_virtual_machine" "vm" {
  name                = "example-vm"
  location           = azurerm_resource_group.az104-06.location
  resource_group_name = azurerm_resource_group.az104-06.name
  size                = "Standard_B1ls"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.vm00.id
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDHiBXSqnB0ApgyG2M2n6SxJd9alb8MTKVI/dd834eQV/rdMlw2nXEvoreMqBQFc1K09xbzWWldDLBAROHhRxbO4hACt8X1OPRkswyLHH+im6ee9/k3CIxvOO/PqQ9JLDx/ig4WgLud8QnxT8nu893yl3lJMO+XhXh+7pbaL69zsLi1ZfxGo6pbGhZV6xTzILk/WParqkzDc3/s5FsGYej7oaacs65zm2hugatbASJJpwOBypcIUpyehdACVu8VAHWMIaGYIuplFS1v2a3Vg0INCyJS/X8BG768ov7Q43x/tqUM3weaRlilPWAL3u3XZsRgRXOmOfUvZQoKO1ZJfLLuG/HpUzDMWKPcp1YqV3JChbZVQACx/AeJxGyUeGepv2EbvgIwu2B3ONntW7qXVK+ck1Kx8ZQUhotM/FcHSNPmxrToQKYA9Ytu4CsD5pFPlOAIaYzXgRbfg7ZZNuuKir/teUB+4fZqH9p6KaYg1fkGLfE5F+u4k+rmTEd90XQ5qc7N7LwCcAGJtg1Zd+QBVqcXTyJmyUDJMbgwMI/RZIO46cNJbwiNE2F+JJvAEz+InyQa7RR+z684jq8P54RbszGmMotzprECvc1/aLC1zB6Gf/JrjFotyWo/qLAL0Ue2u+1IO91F+3iWgNaLZ43KPe/djcjAqAteoZzScRK+jIxlCw== brunosantosc1@gmail.com"
  }
}