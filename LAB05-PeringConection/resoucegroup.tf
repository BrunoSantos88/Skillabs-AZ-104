provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "az104-05" {
  name     = "az104-05-rg1"
  location = "East US"
}
