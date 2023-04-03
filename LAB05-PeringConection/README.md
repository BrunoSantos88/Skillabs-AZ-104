# Implement Intersite Connectivity

</p>
<img src="https://user-images.githubusercontent.com/91704169/228569534-3772ca89-01f2-4f74-aee6-75d603965f8d.png" min-width=1000px" max-width="100px" width="1000px" align="centter" alt="Lab05">

Criar Resouce Group
- Resource Gorup az104-05-rg1

Criar VNET - Subnet
- az104-05-vnet-0 Cidr  10.50.0.0/22
- - Subnet 0 - cidr 10.50.0.0/24
- az104-05-vnet-1 10.51.0.0/22
- - subnet 0 - cidr 10.51.0.0/24
- az104-05-vnet-2 10.52.0.0/22
- - Subnet 0 - 10.52.0.0/24


Criar Pering conection
- az104-05-vnet-0 --- az104-05-vnet-2 "global"
- az104-05-vnet-1 -- az104-05-vnet-2  "global"
- az104-05-vnet-0 -- az104-05-vnet-1  "local"

Criar VMS 

- az104-05-vm0 Ip Static 10.50.0.4
- az104-05-vm1 Ip Static 10.51.0.4
- az104-05-vm2 Ip Static 10.52.0.4
