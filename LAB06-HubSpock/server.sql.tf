resource "azurerm_mysql_server" "az104-06sql" {
  name                = "mysql-server"
  location            = azurerm_resource_group.az104-06.location
  resource_group_name = azurerm_resource_group.az104-06.name
  administrator_login = "adminadmin"
  administrator_login_password = "*mulekao1988*"
  sku_name   = "GP_Gen5_2"
  storage_mb = 5120
  version    = "5.7"

  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = true
  infrastructure_encryption_enabled = true
  public_network_access_enabled     = false
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = "TLS1_2"
}

resource "azurerm_mysql_database" "example" {
  name                = "exampledb"
  resource_group_name = azurerm_resource_group.az104-06.name
  server_name         = azurerm_mysql_server.az104-06sql.id
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}

resource "azurerm_mysql_virtual_network_rule" "az104-06netsql" {
  name                = "example-mysql-vnet-rule"
  server_name         = azurerm_mysql_server.az104-06sql.name
  resource_group_name = azurerm_resource_group.az104-06.name
  subnet_id           = azurerm_subnet.subnet3.id

  depends_on = [
    azurerm_mysql_server.az104-06sql,
    azurerm_network_interface.vm03
  ]
}