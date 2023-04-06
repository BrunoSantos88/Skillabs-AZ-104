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
  location            = azurerm_resource_group.az104-06.location
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