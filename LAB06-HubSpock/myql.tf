resource "azurerm_mssql_server" "example" {
  name                         = "uniqueazuresqlserver"
  resource_group_name          = azurerm_resource_group.az104-06.name
  location                     = azurerm_resource_group.az104-06.location
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
}

resource "azurerm_mssql_virtual_network_rule" "example" {
  name      = "sql-vnet-rule"
  server_id = azurerm_mssql_server.example.id
  subnet_id = azurerm_subnet.subnet3.id
}