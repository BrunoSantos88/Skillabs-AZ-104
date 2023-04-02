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
  subnet_id = azurerm_subnet.subnet3.id

}

resource "azurerm_mysql_database" "example" {
  name                = "example-mysql-database"
  resource_group_name = azurerm_resource_group.az104-06.name
  server_name         = azurerm_mysql_server.example.name
  charset             = "utf8"
  collation           = "utf8_general_ci"

  # ...
}