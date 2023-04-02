resource "azurerm_virtual_machine" "myvm" {
  name                  = "my-vm"
  location           = azurerm_resource_group.az104-06.location
  resource_group_name = azurerm_resource_group.az104-06.name
  network_interface_ids = [azurerm_network_interface.vm00.id]
  vm_size               = "Standard_B1ls"

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
    computer_name  = "my-vm"
    admin_username = "adminuser"
    admin_password = "adminpassword"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  boot_diagnostics {
    storage_account_uri = "https://mystorageaccount.blob.core.windows.net/"
  }
}