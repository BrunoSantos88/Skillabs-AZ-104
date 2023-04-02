resource "azurerm_linux_virtual_machine" "az-104vm0" {
  name                  = "az104-06vm0"
  location           = azurerm_resource_group.az104-06.location
  resource_group_name = azurerm_resource_group.az104-06.name
  network_interface_ids = [azurerm_network_interface.vm00.id]

  size                 = "Standard_B2s"
  admin_username       = "myadminusername"
  admin_password       = "myadminpassword"

  os_profile_linux_config {
    disable_password_authentication = true

  ssh_keys {
      path     = "/home/myadminusername/.ssh/authorized_keys"
      key_data = azurerm_key_vault_secret.example.value
    }

  os_disk {
    name              = "myosdisk"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
}