resource "azurerm_mysql_server" "example" {
  name                = "example-mysql-server"
  location            = azurerm_resource_group.az104-06.location
  resource_group_name = azurerm_resource_group.az104-06.name
  sku_name            = "B_Gen5_1"
  storage_mb          = 5120
  version             = "5.7"

  administrator_login          = "mysqladmin"
  administrator_login_password = "password123"

  network_configuration {
    subnet_id = azurerm_virtual_network.subnet3.id
    public_ip_address_id = null
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.63.0.4"

  }
}

resource "azurerm_mysql_database" "example" {
  name                = "example-mysql-database"
  server_name         = azurerm_mysql_server.example.name
  resource_group_name = azurerm_resource_group.az104-06.name
  charset             = "utf8"
  collation           = "utf8_general_ci"
}