#VM0
resource "azurerm_linux_virtual_machine" "az-104-vm0" {
    name                  = "az104-vm0"
    location           = azurerm_resource_group.az104-08.location
    resource_group_name = azurerm_resource_group.az104-08.name
    size                = "Standard_F2"
    availability_set_id = azurerm_availability_set.DemoAset.id
    network_interface_ids = [
    azurerm_network_interface.vm00.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  computer_name  = "az104-vm0"
  disable_password_authentication = true
}