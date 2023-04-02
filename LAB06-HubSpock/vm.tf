data "azurerm_image" "ubuntu" {
  name                = "UbuntuServer"
  resource_group_name = "Canonical"
  publisher           = "Canonical"
  offer               = "UbuntuServer"
  sku                 = "20.04-LTS"
}

resource "azurerm_virtual_machine" "az104-06-v0" {
  name                  = "az104-06-vm0"
  location              = "East US"
  resource_group_name   = azurerm_resource_group.az104-06.name
  network_interface_ids = [azurerm_network_interface.vm00.id]
  vm_size               = "Standard_B2s"

  storage_os_disk {
    name              = "example-os-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    id = data.azurerm_image.ubuntu.id
  }

  os_profile {
    computer_name  = "example-vm"
    admin_username = "adminuser"
    admin_password = "Password1234!"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}