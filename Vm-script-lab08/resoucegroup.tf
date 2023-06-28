provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "az104-08" {
  name     = "az104-08-rg1"
  location = "East US"
}