resource "azurerm_public_ip" "example" {
  name                = "example-publicip"
  location            = "East US"
  resource_group_name = azurerm_resource_group.example.name
  allocation_method   = "Dynamic"

  tags = {
    environment = "dev"
  }

  sku {
    name = "Standard"
  }
}