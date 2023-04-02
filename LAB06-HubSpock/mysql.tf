resource "azurerm_mysql_server" "example" {
  name                = "az104mysqlserver"
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

resource "azurerm_mysql_virtual_network_rule" "example" {
  name                = "mysql-vnet-rule"
  resource_group_name = azurerm_resource_group.az104-06.name
  server_name         = azurerm_mysql_server.example.name
  subnet_id           = azurerm_subnet.subnet3.id
}


#interface Banco de Dados
resource "azurerm_network_interface" "vnet-mysql" {
  name                = "vm-mysqlserver"
  location            = azurerm_resource_group.az104-06.location
  resource_group_name = azurerm_resource_group.az104-06.name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.subnet3.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.63.0.4"
    }

    tags = {
    environment = "BancoDados"
    }
}



