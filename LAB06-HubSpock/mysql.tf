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
resource "azurerm_virtual_network" "myqlvnet" {
  name                = "myql-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.az104-06.location
  resource_group_name = azurerm_resource_group.az104-06.name
}

resource "azurerm_subnet" "mysql-subnet" {
  name                 = "mysql-subnet"
  resource_group_name = azurerm_resource_group.az104-06.name
  virtual_network_name = azurerm_virtual_network.myqlvnet.name
  address_prefixes     = ["10.63.0.0/24"]
}

resource "azurerm_network_interface" "mysq-vnet" {
  name                = "mysql-nic"
  location            = azurerm_resource_group.az104-06.location
  resource_group_name = azurerm_resource_group.az104-06.name

  ip_configuration {
    name                          = "example-ip-config"
    subnet_id                     = azurerm_subnet.mysql-subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_mysql_virtual_network_rule" "example" {
  name                = "example-vnet-rule"
  resource_group_name = "example-resource-group"
  server_name         = azurerm_mysql_server.az104myzsql.name
  subnet_id           = azurerm_subnet.mysql-subnet.id
  virtual_network_subnet_id = azurerm_network_interface.mysq-vnet.id

  depends_on = [
    azurerm_subnet.mysql-subnet,
    azurerm_network_interface.mysq-vnet
  ]
}