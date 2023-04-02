resource "azurerm_virtual_network" "example" {
  name                = "example-vnet"
  location            = "East US"
  resource_group_name =  azurerm_resource_group.az104-06.name
  address_space       = ["10.0.0.0/16"]

  subnet {
    name           = "example-subnet"
    address_prefix = "10.0.1.0/24"
  }
}

resource "azurerm_mysql_server" "example" {
  name                = "example-mysql-server"
  location            = "East US"
  resource_group_name = "example-resource-group"
  sku_name            = "B_Gen5_1"
  storage_mb          = 5120
  version             = "5.7"

  administrator_login          = "mysqladmin"
  administrator_login_password = "password123"

  # Associate the server with the example-subnet
  vnet_subnet_id = azurerm_virtual_network.example.subnet.id
}