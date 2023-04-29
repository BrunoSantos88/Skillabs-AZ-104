# Skillabs-AZ-104-Terraform
Laboratorios Skillabs AZ-104 -- Guia para uso do Terraform para criar metodologia rapida para agilizar criação dos LABS

Para Iniciar os LABS pre requisito esta familiarizado com cloudShell --- Necessario Criar um Repositorio com o BASH

1° -Verificar se o GIT e Terraform ja estão pré instalados.

LABS que precisa ter efetuados antes de seguir com os preparativos com o Terraform para Inicializaçao rapida.

Sao os LABS.
- Azure Active Directory Identities 
- Subscriptions and RBAC / Manage Governance via Azure Policy 
- Azure resources by Using the Azure Portal 
- Azure resources by Using ARM Templates
- Azure resources by Using Azure PowerShell 
- Azure resources by Using Azure CLI

Incialização dos LAB sempre começa assim:
* Inicio dos LAB sempre no portal azure login
- https://portal.azure.com/#home
- Login: LabUser-29864563@#######################.com Senha: #####

* Criar ClousShell com o BASH 
- verificar Terraform e git se estao pré instalados
- Commandos: terraform --version e git --version
- Por Padrao o Terraform e o GIT ja está instalado

Dica: Resorce Group vc pode criar normalmente, mais conta de armazenamento sempre com letras minusculas sem traço ou espaço. </p>
Criar cloud shell -- pode criar default

- Chave SSH vc tem criar no CLOUD SHELL BASH 
- Commando ssh-keygen

$ PATH chave publica passar na public key da VM no arquivo terraform "~/.ssh/id_rsa.pub"

