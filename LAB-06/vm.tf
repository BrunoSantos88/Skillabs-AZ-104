##az104-06-vm0
resource "azurerm_windows_virtual_machine" "az104-06-vm0" {
  name                = "az104-06-vm0"
  resource_group_name = "az104-06-rg1"
  location            = var.resource_group_name_location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
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
}

#az104-06-vm1
resource "azurerm_windows_virtual_machine" "az104-06-vm1" {
  name                = "az104-06-vm1"
  resource_group_name = "az104-06-rg1"
  location            = var.resource_group_name_location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.vm01.id,
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
}

#az104-06-vm2
resource "azurerm_windows_virtual_machine" "az104-06-vm2" {
  name                = "az104-06-vm2"
  resource_group_name = "az104-06-rg1"
  location            = var.resource_group_name_location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.vm02.id,
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
}

#az104-06-vm3
resource "azurerm_windows_virtual_machine" "az104-06-vm3" {
  name                = "az104-06-vm3"
  resource_group_name = "az104-06-rg1"
  location            = var.resource_group_name_location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.vm03.id,
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
}