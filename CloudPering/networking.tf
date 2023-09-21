resource "azurerm_virtual_network" "vnet0" {
  name                = "az104-05-vnet00"
  address_space       = ["10.50.0.0/22"]
  location            = azurerm_resource_group.az104-05.location
  resource_group_name = azurerm_resource_group.az104-05.name
}


resource "azurerm_subnet" "subnet0" {
  name                 = "subnet-00"
  resource_group_name = azurerm_resource_group.az104-05.name
  virtual_network_name = azurerm_virtual_network.vnet0.name
  address_prefixes     = ["10.50.0.0/24"]
}


resource "azurerm_subnet" "subnet1" {
  name                 = "subnet-01"
  resource_group_name = azurerm_resource_group.az104-05.name
  virtual_network_name = azurerm_virtual_network.vnet0.name
  address_prefixes     = ["10.50.1.0/24"]
}

resource "azurerm_network_interface" "vm00" {
  name                = "vm0nic"
  location            = azurerm_resource_group.az104-05.location
  resource_group_name = azurerm_resource_group.az104-05.name
  enable_ip_forwarding = true

    ip_configuration {
    name                          = "vm0nic"
    subnet_id                     = azurerm_subnet.subnet0.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.50.0.4"
    }

    tags = {
    environment = "az106-05-vm0"
    }
}

resource "azurerm_network_interface" "vm01" {
  name                = "vm1nic"
 location            = azurerm_resource_group.az104-05.location
 resource_group_name = azurerm_resource_group.az104-05.name
  enable_ip_forwarding = true

    ip_configuration {
    name                          = "vm1nic"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.50.1.4"
    }

    tags = {
    environment = "az106-05-vm1"
    }
}

