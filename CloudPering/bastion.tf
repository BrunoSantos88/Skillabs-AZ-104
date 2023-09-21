resource "azurerm_virtual_network" "example" {
  name                = "bastion-vnet"
  address_space       = ["10.40.0.0/22"]
   location               = azurerm_resource_group.bastion.location.id
   resource_group_name    = azurerm_resource_group.bastion.name.id
}

resource "azurerm_subnet" "subnet-bastion" {
  name                 = "subnet0-bst"
     resource_group_name    = azurerm_resource_group.bastion.name.id
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.40.0.0/24"]
}


resource "azurerm_network_interface" "bastion" {
  name                = "vm0nic"
  location               = azurerm_resource_group.bastion.location.id
   resource_group_name    = azurerm_resource_group.bastion.name.id
  enable_ip_forwarding = true

    ip_configuration {
    name                          = "piblicip-0"
    subnet_id                     = azurerm_subnet.subnet-bastion.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.mypublicip0.id
  }

  tags = {
    environment = "bastion-vm0"
    }
}

resource "azurerm_public_ip" "mypublicip0" {
  name                = "my-bastion-ip"
  location            = azurerm_resource_group.bastion.location.id
  resource_group_name    = azurerm_resource_group.bastion.name.id
  allocation_method   = "Dynamic"
  ip_version          = "IPv4"
}




