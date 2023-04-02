resource "azurerm_linux_virtual_machine" "az104-vm0" {
  name                = "az104-06-vm0"
  location           = azurerm_resource_group.az104-06.location
  resource_group_name = azurerm_resource_group.az104-06.name
  size                 = "Standard_DS1_v2"
  network_interface_ids = [azurerm_network_interface.vm00.id]

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "my-os-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "az104-vm0"
    admin_username = "adminuser"
    admin_password = "adminpassword"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = {
    environment = "frontend"
  }
}
