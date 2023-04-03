# interface de 

resource "azurerm_network_interface" "vm00" {
  name                = "vm0nic"
  location            = var.resource_group_name_location
  resource_group_name = "az104-06-rg1"
  enable_ip_forwarding = true

    ip_configuration {
    name                          = "vm0nic"
    subnet_id                     = azurerm_subnet.subnet0.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.60.0.4"
    }

    tags = {
    environment = "az106-06-vm0"
    }
}

resource "azurerm_network_interface" "vm01" {
  name                = "vm1nic"
  location            = var.resource_group_name_location
  resource_group_name = "az104-06-rg1"
  enable_ip_forwarding = true

    ip_configuration {
    name                          = "vm1nic"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.60.1.4"
    }

    tags = {
    environment = "az106-06-vm1"
    }
}

resource "azurerm_network_interface" "vm02" {
  name                = "vm2nic"
  location            = var.resource_group_name_location
  resource_group_name = "az104-06-rg1"
  enable_ip_forwarding = true

    ip_configuration {
    name                          = "vm2nic"
    subnet_id                     = azurerm_subnet.subnet-vnet02.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.62.0.4"
    }

    tags = {
    environment = "az106-06-vm2"
    }
}

resource "azurerm_network_interface" "vm03" {
  name                = "vm3nic"
  location            = var.resource_group_name_location
  resource_group_name = "az104-06-rg1"
  enable_ip_forwarding = true

    ip_configuration {
    name                          = "vm3nic"
    subnet_id                     = azurerm_subnet.subnet-vnet03.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.63.0.4"
    }

    tags = {
    environment = "az106-06-vm3"
    }
}