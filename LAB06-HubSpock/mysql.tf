resource "azurerm_mysql_server" "az104myzsql" {
  name                = "myzsqlserver"
  location            = azurerm_resource_group.az104-06.location
  resource_group_name = azurerm_resource_group.az104-06.name
  administrator_login = "AdmimAdmym88"
  administrator_login_password = "*Mulekao1988*"
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

resource "azurerm_mysql_database" "az104mywsql" {
  name                = "mywsqlserver"
  resource_group_name = azurerm_resource_group.az104-06.name
  server_name         = azurerm_mysql_server.az104myzsql.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}

###regras de rede
resource "azurerm_network_interface" "vm03" {
  name                = "vm3nic"
  location            = azurerm_resource_group.az104-06.location
  resource_group_name = azurerm_resource_group.az104-06.name
  enable_ip_forwarding = true

    ip_configuration {
    name                          = "vm3nic"
    subnet_id                     = azurerm_subnet.subnet3.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.63.0.4"
    }

    tags = {
    environment = "az106-06-vm3"
    }
}

resource "azurerm_mysql_virtual_network_rule" "example" {
  name                = "mysql-vnet-rule"
  resource_group_name = azurerm_resource_group.az104-06.name
  server_name         = azurerm_mysql_server.az104myzsql.id
  subnet_id           = azurerm_subnet.subnet3.id
}