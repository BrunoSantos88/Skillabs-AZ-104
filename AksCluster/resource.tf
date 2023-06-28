provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "az104-aks" {
  name     = "az104-aks-rg1"
  location = "East US"
}
