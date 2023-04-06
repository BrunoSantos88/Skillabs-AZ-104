# SELECIONAR MODULO ANTES DE INICIAR TERRAFORM

#module "VIRTUAL_MACHINE_DNS" {
 # source = "./VirtualNetworking"   
#}

#module "LAB-PERING_CONECTION" {
#   source = "./PeringConection"   
#}

module "LAB-HUBSPOCK" {
  source = "./HubSpock"
}
