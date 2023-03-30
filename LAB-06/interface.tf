resource "azurerm_network_interface" "vm00" {
  name                = "vm0-nic"
  location            = var.resource_group_name_location
  resource_group_name = var.resource_group_name_az104-06-rg1

  ip_configuration {
    name                          = "vm00"
    subnet_id                     = azurerm_subnet.subnet0.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface" "vm01" {
  name                = "vm1-nic"
  location            = var.resource_group_name_location
  resource_group_name = var.resource_group_name_az104-06-rg1

  ip_configuration {
    name                          = "vm01"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface" "vm02" {
  name                = "vm2-nic"
  location            = var.resource_group_name_location
  resource_group_name = var.resource_group_name_az104-06-rg1

  ip_configuration {
    name                          = "vm02"
    subnet_id                     = azurerm_subnet.subnet-vnet02.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface" "vm03" {
  name                = "vm3-nic"
  location            = var.resource_group_name_location
  resource_group_name = var.resource_group_name_az104-06-rg1

  ip_configuration {
    name                          = "vm03"
    subnet_id                     = azurerm_subnet.subnet-vnet03.id
    private_ip_address_allocation = "Dynamic"
  }
}