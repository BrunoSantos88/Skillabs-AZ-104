resource "azurerm_container_registry" "acr" {
  name                = "aplication"
  resource_group_name = var.resoucegroup
  location            = var.location
  sku                 = "Premium"
  admin_enabled       = false
  georeplications {
    location                = "East US"
    zone_redundancy_enabled = true
    tags                    = {}
  }
}