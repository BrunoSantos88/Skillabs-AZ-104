resource "azurerm_linux_virtual_machine" "vm0" {
  name                  = "az104-06-vm0"
  location              = var.location
  resource_group_name   = var.resoucegroup
  network_interface_ids = [azurerm_network_interface.interface0.id]
  size                  = "Standard_DS1_v2"

  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  computer_name                   = "myvm"
  admin_username                  = "azureuser"
  disable_password_authentication = true

  admin_ssh_key {
    username   = "azureuser"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC1iO4/5O781c7tbiaS7Q8qfk9D6sscspsQisQOxbIzxBGfH6dxv+YdQFP5Ka2DaWX0ZOwShudCJiagdxp1Db9PgbQj5Cg+Vr7DklcQxooNDkWvK5Km/lHz+Xr2ObyNmdO+zFzd7dNW5sewh4DgI59cfjzd2gS2H8tZNVQcO+Xrgy8n6dBAVGDWPrjU8LcQcUrBGuMHoLQc3tZwCYOwfb98hFIFB+UAa7xYrG5kSyCpTZKMhBD4fWbgABz7LR8Bm10snFbB1AY+Peu5GsioT/krn2ksXr//aMqpdi8KesPSfD0/wCknyPYK0L+7PPVtSHqB01qKGvGSvKIR+/svr131wiO3riplh4thO+veVq0NJfOVW1oqmhVs57l1duUfqclR99giT0IVvmtzJepNr6qRJwOqVFDIvUPKYhmG3eB1FMTJBr3IpKJ3b+S/rASCIbMuhimDGjj7Cz09X90WZrxMYLSeDSTNAs1zTL7d03BcF2m2oJqej0MKmwe1J5WaXSc= casa@DESKTOP-6CPG9BJ"
  }

  }

  resource "azurerm_linux_virtual_machine" "vm1" {
  name                  = "az104-06-vm1"
  location              = var.location
  resource_group_name   = var.resoucegroup
  network_interface_ids = [azurerm_network_interface.vm01.id]
  size                  = "Standard_DS1_v2"

  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  computer_name                   = "myvm"
  admin_username                  = "azureuser"
  disable_password_authentication = true

  admin_ssh_key {
    username   = "azureuser"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC1iO4/5O781c7tbiaS7Q8qfk9D6sscspsQisQOxbIzxBGfH6dxv+YdQFP5Ka2DaWX0ZOwShudCJiagdxp1Db9PgbQj5Cg+Vr7DklcQxooNDkWvK5Km/lHz+Xr2ObyNmdO+zFzd7dNW5sewh4DgI59cfjzd2gS2H8tZNVQcO+Xrgy8n6dBAVGDWPrjU8LcQcUrBGuMHoLQc3tZwCYOwfb98hFIFB+UAa7xYrG5kSyCpTZKMhBD4fWbgABz7LR8Bm10snFbB1AY+Peu5GsioT/krn2ksXr//aMqpdi8KesPSfD0/wCknyPYK0L+7PPVtSHqB01qKGvGSvKIR+/svr131wiO3riplh4thO+veVq0NJfOVW1oqmhVs57l1duUfqclR99giT0IVvmtzJepNr6qRJwOqVFDIvUPKYhmG3eB1FMTJBr3IpKJ3b+S/rASCIbMuhimDGjj7Cz09X90WZrxMYLSeDSTNAs1zTL7d03BcF2m2oJqej0MKmwe1J5WaXSc= casa@DESKTOP-6CPG9BJ"
  }

  }

  resource "azurerm_linux_virtual_machine" "vm2" {
  name                  = "az104-06-vm2"
  location              = var.location
  resource_group_name   = var.resoucegroup
  network_interface_ids = [azurerm_network_interface.vm02.id]
  size                  = "Standard_DS1_v2"

  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  computer_name                   = "myvm"
  admin_username                  = "azureuser"
  disable_password_authentication = true

  admin_ssh_key {
    username   = "azureuser"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC1iO4/5O781c7tbiaS7Q8qfk9D6sscspsQisQOxbIzxBGfH6dxv+YdQFP5Ka2DaWX0ZOwShudCJiagdxp1Db9PgbQj5Cg+Vr7DklcQxooNDkWvK5Km/lHz+Xr2ObyNmdO+zFzd7dNW5sewh4DgI59cfjzd2gS2H8tZNVQcO+Xrgy8n6dBAVGDWPrjU8LcQcUrBGuMHoLQc3tZwCYOwfb98hFIFB+UAa7xYrG5kSyCpTZKMhBD4fWbgABz7LR8Bm10snFbB1AY+Peu5GsioT/krn2ksXr//aMqpdi8KesPSfD0/wCknyPYK0L+7PPVtSHqB01qKGvGSvKIR+/svr131wiO3riplh4thO+veVq0NJfOVW1oqmhVs57l1duUfqclR99giT0IVvmtzJepNr6qRJwOqVFDIvUPKYhmG3eB1FMTJBr3IpKJ3b+S/rASCIbMuhimDGjj7Cz09X90WZrxMYLSeDSTNAs1zTL7d03BcF2m2oJqej0MKmwe1J5WaXSc= casa@DESKTOP-6CPG9BJ"
  }

  }


  resource "azurerm_linux_virtual_machine" "vm3" {
  name                  = "az104-06-vm3"
  location              = var.location
  resource_group_name   = var.resoucegroup
  network_interface_ids = [azurerm_network_interface.vm03.id]
  size                  = "Standard_DS1_v2"

  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  computer_name                   = "myvm"
  admin_username                  = "azureuser"
  disable_password_authentication = true

  admin_ssh_key {
    username   = "azureuser"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC1iO4/5O781c7tbiaS7Q8qfk9D6sscspsQisQOxbIzxBGfH6dxv+YdQFP5Ka2DaWX0ZOwShudCJiagdxp1Db9PgbQj5Cg+Vr7DklcQxooNDkWvK5Km/lHz+Xr2ObyNmdO+zFzd7dNW5sewh4DgI59cfjzd2gS2H8tZNVQcO+Xrgy8n6dBAVGDWPrjU8LcQcUrBGuMHoLQc3tZwCYOwfb98hFIFB+UAa7xYrG5kSyCpTZKMhBD4fWbgABz7LR8Bm10snFbB1AY+Peu5GsioT/krn2ksXr//aMqpdi8KesPSfD0/wCknyPYK0L+7PPVtSHqB01qKGvGSvKIR+/svr131wiO3riplh4thO+veVq0NJfOVW1oqmhVs57l1duUfqclR99giT0IVvmtzJepNr6qRJwOqVFDIvUPKYhmG3eB1FMTJBr3IpKJ3b+S/rASCIbMuhimDGjj7Cz09X90WZrxMYLSeDSTNAs1zTL7d03BcF2m2oJqej0MKmwe1J5WaXSc= casa@DESKTOP-6CPG9BJ"
  }

  }