resource "azurerm_mysql_server" "az104-sql" {
  name                = "az104-06-database"
  location            = azurerm_resource_group.az104-06.location
  resource_group_name = azurerm_resource_group.az104-06.name

  administrator_login          = "mysqladminun"
  administrator_login_password = "H@Sh1CoR3!"

  sku_name   = "GP_Gen5_2"
  storage_mb = 5120
  version    = "5.7"

  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  ssl_enforcement_enabled      = true
}

resource "azurerm_mysql_virtual_network_rule" "az104sql" {
  name                = "mysql-vnet-rule"
  resource_group_name = azurerm_resource_group.az104-06.name
  server_name         = azurerm_mysql_server.az104-sql.id
  subnet_id           = azurerm_subnet.subnet3.id
}