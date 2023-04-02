resource "azurerm_mysql_server" "example" {
  name                = "mydatabase"
  location            = azurerm_resource_group.az104-06.location
  resource_group_name = azurerm_resource_group.az104-06.name
  administrator_login          = "myadminuser"
  administrator_login_password = "myadminpassword"

  sku_name   = "GP_Gen5_2"
  storage_mb = 5120

  ssl_enforcement_enabled = true

  subnet_id = azurerm_subnet.subnet3.id
}
