# SELECIONAR MODULO ANTES DE INICIAR TERRAFORM

module "VIRTUAL_MACHINE_DNS" {
    source = "./LAB-04"   
}

module "LAB-PERING_CONECTION" {
    source = "./LAB-05"   
}

module "LAB-HUBSPOCK" {
    source = "./LAB-06"   
}


resource "azurerm_resource_group" "az104-06-rg1" {
  location = "eastus"
  name     = "az104-06-rg1"
}

resource "azurerm_resource_group" "az104-06-rg4" {
  location = "eastus"
  name     = "az104-06-rg4"
}

resource "azurerm_resource_group" "az104-06-rg5" {
  location = "eastus"
  name     = "az104-06-rg5"
}