#VNET-00
resource "azurerm_network_interface" "vnet-0" {
  name                = "venet0-nic"
  location            = var.resource_group_name_location
  resource_group_name = var.resource_group_name_az104-06-rg1


  ip_configuration {
    name                          = "vnet0"
    subnet_id                     = azurerm_subnet.subnet0.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vnet-0.id

  }
}

resource "azurerm_public_ip" "vnet-0" {
  name                = "vnet-ip-00"
  resource_group_name = var.resource_group_name_az104-06-rg4
  location            = var.resource_group_name_location
  allocation_method   = "Dynamic"
}


#Vnet-01
resource "azurerm_network_interface" "vnet-1" {
  name                = "vnet01-nic"
  location            = var.resource_group_name_location
  resource_group_name = var.resource_group_name_az104-06-rg1

  ip_configuration {
    name                          = "vnet-ip-01"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vnet-01_ip.id
  }
}

resource "azurerm_public_ip" "vnet-01_ip" {
  name                = "vm_vnet-01_ip"
  resource_group_name = var.resource_group_name_az104-06-rg1
  location            = var.resource_group_name_location
  allocation_method   = "Dynamic"
}