resource "azurerm_mysql_server" "example" {
  name                = "mydatabase"
  location            = azurerm_resource_group.az104-06.location
  resource_group_name = azurerm_resource_group.az104-06.name
  administrator_login          = "myadminuser"
  administrator_login_password = "myadminpassword"
  version             = "5.7"

  sku_name   = "GP_Gen5_2"
  storage_mb = 5120

  ssl_enforcement_enabled = true

  private_endpoint_connections {
    name                          = "myprivateendpoint"
    private_connection_resource_id = azurerm_mysql_server.example.id
    is_manual_connection          = false
    private_connection_subnet_id  = azurerm_subnet.subnet3.id
     private_ip_address            = "10.63.0.4"
  }
}