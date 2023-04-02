provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "az104-06" {
  name     = "az104-06-rg1"
  location = "East US"
}

resource "azurerm_resource_group" "az104-rs04" {
  name     = "az104-06-rg4"
  location = "East US"
}

resource "azurerm_resource_group" "az104-rs5" {
  name     = "az104-06-rg5"
  location = "East US"
}

resource "azurerm_virtual_network" "vnet1" {
  name                = "az104-06-vnet01"
  address_space       = ["10.60.0.0/22"]
  location            = azurerm_resource_group.az104-06.location
  resource_group_name = azurerm_resource_group.az104-06.name
}

resource "azurerm_virtual_network" "vnet2" {
  name                = "az104-06-vnet02"
  address_space       = ["10.62.0.0/22"]
  location           = azurerm_resource_group.az104-06.location
  resource_group_name = azurerm_resource_group.az104-06.name
}

resource "azurerm_virtual_network" "vnet3" {
  name                = "az104-06-vnet03"
  address_space       = ["10.63.0.0/22"]
  location           = azurerm_resource_group.az104-06.location
  resource_group_name = azurerm_resource_group.az104-06.name
}

resource "azurerm_subnet" "subnet0" {
  name                 = "subnet0"
  resource_group_name = azurerm_resource_group.az104-06.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.60.0.0/24"]
}

resource "azurerm_subnet" "subnet1" {
  name                 = "subnet1"
  resource_group_name = azurerm_resource_group.az104-06.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.60.1.0/24"]
}

resource "azurerm_subnet" "subnet2" {
  name                 = "subnet0"
  resource_group_name = azurerm_resource_group.az104-06.name
  virtual_network_name = azurerm_virtual_network.vnet2.name
  address_prefixes     = ["10.62.0.0/24"]
}

resource "azurerm_subnet" "subnet3" {
  name                 = "subnet0"
  resource_group_name = azurerm_resource_group.az104-06.name
  virtual_network_name = azurerm_virtual_network.vnet3.name
  address_prefixes     = ["10.63.0.0/24"]
}

# interface de Rede
resource "azurerm_network_interface" "vm00" {
  name                = "vm0nic"
  location            = azurerm_resource_group.az104-06.location
  resource_group_name = azurerm_resource_group.az104-06.name
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
 location            = azurerm_resource_group.az104-06.location
 resource_group_name = azurerm_resource_group.az104-06.name
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
  location            = azurerm_resource_group.az104-06.location
  resource_group_name = azurerm_resource_group.az104-06.name
  enable_ip_forwarding = true

    ip_configuration {
    name                          = "vm2nic"
    subnet_id                     = azurerm_subnet.subnet2.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.62.0.4"
    }

    tags = {
    environment = "az106-06-vm2"
    }
}

resource "azurerm_network_interface" "vm03" {
  name                = "vm3nic"
  location            = azurerm_resource_group.az104-06.location
  resource_group_name = azurerm_resource_group.az104-06.name
  enable_ip_forwarding = true

    ip_configuration {
    name                          = "vm3nic"
    subnet_id                     = azurerm_subnet.subnet3.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.63.0.4"
    }

    tags = {
    environment = "az106-06-vm3"
    }
}


#peringconection
resource "azurerm_virtual_network_peering" "vnet1_to_vnet2" {
  name                         = "vnet1-to-vnet2"
  resource_group_name          = azurerm_resource_group.az104-06.name
  virtual_network_name         = azurerm_virtual_network.vnet1.name
  remote_virtual_network_id    = azurerm_virtual_network.vnet2.id
   allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "vnet1_to_vnet3" {
  name                         = "vnet1-to-vnet3"
  resource_group_name          = azurerm_resource_group.az104-06.name
  virtual_network_name         = azurerm_virtual_network.vnet1.name
  remote_virtual_network_id    = azurerm_virtual_network.vnet3.id
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

###ROUTE TABLE
resource "azurerm_route_table" "rt23" {
  name                = "az-10406-rt23"
  location            = "East US"
  resource_group_name = azurerm_resource_group.az104-06.name
}


  resource "azurerm_route" "rt23-route1" {
  name                = "route-1"
  address_prefix      = "10.62.0.0/24"
  next_hop_type       = "VirtualAppliance"
  next_hop_in_ip_address = "10.62.0.4"
  route_table_name    = azurerm_route_table.rt23.name
  resource_group_name = azurerm_resource_group.az104-06.name
}

resource "azurerm_route" "rt23-route2" {
  name                = "route-2"
  address_prefix      = "10.60.0.0/24"
  next_hop_type       = "VirtualAppliance"
  next_hop_in_ip_address = "10.60.0.4"
  route_table_name    = azurerm_route_table.rt23.name
  resource_group_name = azurerm_resource_group.az104-06.name
}

resource "azurerm_subnet_route_table_association" "rt23" {
  subnet_id      = azurerm_subnet.subnet0.id
  route_table_id = azurerm_route_table.rt23.id
}

resource "azurerm_route_table" "rt32" {
  name                = "az-10406-rt32"
  location            = "East US"
  resource_group_name = azurerm_resource_group.az104-06.name
}


  resource "azurerm_route" "rt32-route1" {
  name                = "route-1"
  address_prefix      = "10.63.0.0/24"
  next_hop_type       = "VirtualAppliance"
  next_hop_in_ip_address = "10.63.0.4"
  route_table_name    = azurerm_route_table.rt32.name
  resource_group_name = azurerm_resource_group.az104-06.name
}

resource "azurerm_route" rt32-route2 {
  name                = "route-2"
  address_prefix      = "10.60.1.0/24"
  next_hop_type       = "VirtualAppliance"
  next_hop_in_ip_address = "10.60.1.4"
  route_table_name    = azurerm_route_table.rt32.name
  resource_group_name = azurerm_resource_group.az104-06.name
}

resource "azurerm_subnet_route_table_association" "rt32" {
  subnet_id      = azurerm_subnet.subnet1.id
  route_table_id = azurerm_route_table.rt32.id
}