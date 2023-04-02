resource "azurerm_mysql_server" "example" {
  name                = "my-mysql-server"
  resource_group_name = azurerm_resource_group.example.name
  location            = "westus2"
  sku_name            = "B_Gen5_1"
  storage_mb          = 5120
  administrator_login = "mysqladmin"
  administrator_login_password = "MyP@ssw0rd!"
  version = "5.7"

  private_network_interface_ids = [
    azurerm_network_interface.vm03.id,
  ]

  ssl_enforcement_enabled = true
  ssl_minimal_tls_version_enforced = "TLSEnforcement_1_2"

  fqdn = "my-mysql-server.internal"
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