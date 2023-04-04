# SELECIONAR MODULO ANTES DE INICIAR TERRAFORM

#module "VIRTUAL_MACHINE_DNS" {
 # source = "./LAB04-VirtualNetworking"   
#}

#module "LAB-PERING_CONECTION" {
#   source = "./LAB-05"   
#}

module "LAB-HUBSPOCK" {
  source = "./LAB06-HubSpock"
}
