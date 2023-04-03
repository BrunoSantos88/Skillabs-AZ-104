resource "azurerm_linux_virtual_machine" "az-104-vm1" {
    name                  = "az104-vm1"
    location           = azurerm_resource_group.az104-04.location
    resource_group_name = azurerm_resource_group.az104-04.name
    network_interface_ids = [azurerm_network_interface.vm01.id]
    size                  = "Standard_DS1_v2"

    os_disk {
        name              = "az104-disk1"
        caching           = "ReadWrite"
        storage_account_type = "Premium_LRS"
    }

  os_profile_linux_config {
  custom_data = base64encode(file("setup.sh"))
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


    tags = {
        environment = "VM1"
    }
}


