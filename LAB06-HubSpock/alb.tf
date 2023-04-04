resource "azurerm_public_ip" "alb_ip" {
  name                = "my-alb-ip"
  location            = azurerm_resource_group.az104-06.location
  resource_group_name = azurerm_resource_group.az104-rs5.name
  allocation_method   = "Static"
}

resource "azurerm_lb" "alb" {
  name                = "my-alb"
  location            = azurerm_resource_group.az104-06.location
  resource_group_name = azurerm_resource_group.az104-rs5.name
  sku                 = "Standard"
  frontend_ip_configuration {
    name                 = "my-alb-frontend"
    public_ip_address_id = azurerm_public_ip.alb_ip.id
  }
}