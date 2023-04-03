# LAB-04 --- Implement Virtual Networking

</p>
<img src="https://user-images.githubusercontent.com/91704169/228549661-8687ed46-4ab1-4002-8964-dd282877e9bd.png" min-width=1000px" max-width="100px" width="1000px" align="centter" alt="Lab04">

Criar Resouce Group
- Resource Gorup az104-04-rg1

Criar Networking
- Vnet az104-04-vnet1 - CIDR 10.40.0.0/20
-- Subnet0 10.40.0.0/24 
-- --- - az-104-04-nic0 CIDR 10.40.0.4
-- --- - --- - - az-104-04-pip0
-- Subnet1 10.40.1.0/24
-- --- - az-104-04-nic0 CIDR 10.40.1.4
-- --- - --- - az-104-04-pip1
Criar VM
- az-104-04-vm0
- az-104-04-vm1

Criar NSG
- az-104-04-nsg01
regra 1000
tcp 80
regra 1001
tcp 22

-- acesso my ip

Criar DNS
- contoso.org
