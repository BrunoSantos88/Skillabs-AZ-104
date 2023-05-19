resource "azurerm_container_registry" "acr" {
  name                = "developer"
  resource_group_name = var.resoucegroup
  location            = var.location
  sku                 = "Premium"
  admin_enabled       = false
}