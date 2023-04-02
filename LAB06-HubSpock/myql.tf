resource "azurerm_mysql_server" "example" {
  name                = "example-mysql-server"
  location            = azurerm_resource_group.az104-06.location
  resource_group_name = azurerm_resource_group.az104-06.name
  sku_name            = "B_Gen5_1"
  storage_mb          = 5120
  version             = "5.7"

  administrator_login          = "mysqladmin"
  administrator_login_password = "password123"

  # Configure the server to use the example-subnet
  subnet_id = azurerm_subnet.subnet3.name
  public_network_access_enabled = false

}

resource "azurerm_mysql_database" "example" {
  name                = "example-mysql-database"
  server_name         = azurerm_mysql_server.example.id
  resource_group_name = azurerm_resource_group.az104-06.name
  charset             = "utf8"
  collation           = "utf8_general_ci"
}