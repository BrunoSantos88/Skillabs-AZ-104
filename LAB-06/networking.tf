#REDE az104-06-vnet01
resource "azurerm_virtual_network" "az104-06-vnet01" {
  name                = "az104-06-vnet01"
  address_space       = ["10.60.0.0/22"]
  location            = var.resource_group_name_location
  resource_group_name = "az104-06-rg1"
}

resource "azurerm_subnet" "subnet0" {
  name                 = "subnet00"
  resource_group_name  = "az104-06-rg1"
  virtual_network_name = azurerm_virtual_network.az104-06-vnet01.id
  address_prefixes     = ["10.60.0.0/24"]
}

resource "azurerm_subnet" "subnet1" {
  name                 = "subnet01"
  resource_group_name  = "az104-06-rg1"
  virtual_network_name = azurerm_virtual_network.az104-06-vnet01.id
  address_prefixes     = ["10.60.1.0/24"]
}

#REDE az104-06-vnet-02

resource "azurerm_virtual_network" "az104-06-vnet02" {
  name                = "az104-06-vnet02"
  address_space       = ["10.62.0.0/22"]
  location            = var.resource_group_name_location
  resource_group_name = "az104-06-rg1"
}

resource "azurerm_subnet" "subnet-vnet02" {
  name                 = "subnetvnet02"
  resource_group_name  = "az104-06-rg1"
  virtual_network_name = azurerm_virtual_network.az104-06-vnet02.id
  address_prefixes     = ["10.62.0.0/24"]
}

#REDE az104-06-vnet-03

resource "azurerm_virtual_network" "az104-06-vnet03" {
  name                = "az104-06-vnet03"
  address_space       = ["10.63.0.0/22"]
  location            = var.resource_group_name_location
  resource_group_name = "az104-06-rg1"
}

resource "azurerm_subnet" "subnet-vnet03" {
  name                 = "subnetvnet03"
  resource_group_name  = "az104-06-rg1"
  virtual_network_name = azurerm_virtual_network.az104-06-vnet03.id
  address_prefixes     = ["10.63.0.0/24"]
}

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