resource "azurerm_public_ip" "frontend" {
  name                = "frontend-publicip"
  location            = azurerm_resource_group.az104-rs5.location
  resource_group_name = azurerm_resource_group.az104-rs5.name
  allocation_method   = "Dynamic"

  tags = {
    environment = "FRONTEND"
  }
}

resource "azurerm_public_ip" "backend" {
  name                = "backend-publicip"
  location            = azurerm_resource_group.az104-rs5.location
  resource_group_name = azurerm_resource_group.az104-rs5.name
  allocation_method   = "Dynamic"

  tags = {
    environment = "FRONTEND"
  }
}