provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "az104-06" {
  name     = "az104-06-rg1"
  location = "East US"
}

resource "azurerm_resource_group" "az104-rs04" {
  name     = "az104-06-rg4"
  location = "East US"
}

resource "azurerm_resource_group" "az104-rs5" {
  name     = "az104-06-rg5"
  location = "East US"
}