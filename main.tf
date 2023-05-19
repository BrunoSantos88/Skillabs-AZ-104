# SELECIONAR MODULO ANTES DE INICIAR TERRAFORM

 #LAB VIRTUAL NETWORK
# module "VIRTUAL_NETWORK" {
 #  source = "./VirtualNetworking"   
# }

#LAB PERING_CONECTION
#module "LAB-PERING_CONECTION" {
#   source = "./PeringConection"   
#}


#LAB PERING_CONECTION
#module "LAB-PERING_CONECTION" {
#   source = "./PeringConection"   
#}

# LAB AKS
module "AKS-CLUSTER" {       
  source = "./AKS"
}
