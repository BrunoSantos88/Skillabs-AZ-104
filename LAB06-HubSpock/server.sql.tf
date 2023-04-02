resource "azurerm_mysql_server" "az104-06sql" {
  name                = "mysql-server"
  location            = azurerm_resource_group.az104-06.location
  resource_group_name = azurerm_resource_group.az104-06.name
  administrator_login = "exampleadmin"
  administrator_login_password = "examplepassword"
  sku_name   = "GP_Gen5_16"
  storage_mb = 5120
  version    = "5.7"

  storage_profile {
    storage_mb            = 5120
    backup_retention_days = 7
    geo_redundant_backup  = "Disabled"
  }
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