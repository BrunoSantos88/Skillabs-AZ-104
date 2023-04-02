resource "azurerm_resource_group" "example" {
  name     = "myresourcegroup"
  location = "eastus"
}

resource "azurerm_virtual_network" "example" {
  name                = "myvnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_subnet" "example" {
  name                 = "mysubnet"
  address_prefixes     = ["10.0.1.0/24"]
  virtual_network_name = azurerm_virtual_network.example.name
  resource_group_name  = azurerm_resource_group.example.name
}

resource "azurerm_mysql_server" "example" {
  name                = "mydatabase"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  administrator_login          = "myadminuser"
  administrator_login_password = "myadminpassword"

  sku_name   = "GP_Gen5_2"
  storage_mb = 5120

  ssl_enforcement_enabled = true

  private_endpoint_connections {
    name                          = "myprivateendpoint"
    private_connection_resource_id = azurerm_mysql_server.example.id
    is_manual_connection          = false
    private_connection_subnet_id  = azurerm_subnet.example.id
    private_ip_address            = "10.0.1.5" # Static IP address for MySQL server in the subnet
  }

  subnet_id = azurerm_subnet.example.id
}
