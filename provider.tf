# TERRAFORM PRE INSTALADO NO POWERSHELL BASH SO FUNCIONA 2.99.0

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.99.0"
    }
  }
}


provider "azurerm" {
  features {}
}