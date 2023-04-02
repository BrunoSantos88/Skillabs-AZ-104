resource "azurerm_virtual_network" "example" {
  name                = "my-virtual-network"
  address_space       = ["10.0.0.0/16"]
  location            = "westus2"
  resource_group_name = azurerm_resource_group.az104-06.name
}

resource "azurerm_subnet" "example" {
  name                 = "my-subnet"
  resource_group_name = azurerm_resource_group.az104-06.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "example" {
  name                = "my-network-interface"
  location            = "westus2"
  resource_group_name = azurerm_resource_group.az104-06.name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_mysql_server" "example" {
  name                = "my-mysql-server"
  resource_group_name = azurerm_resource_group.az104-06.name
  location            = "westus2"
  sku_name            = "B_Gen5_1"
  storage_mb          = 5120
  administrator_login = "mysqladmin"
  administrator_login_password = "MyP@ssw0rd!"
  version = "5.7"

  private_network_interface_ids = [
    azurerm_network_interface.example.id,
  ]
}