# Skillabs-AZ-104-Terraform
Laboratorios Skillabs AZ-104 -- Guia para uso do Terraform para criar metodologia rapida para agilizar criação dos LABS

Exercício 1
Tarefa 1: provisionar o ambiente de laboratório
Nesta tarefa, você implantará uma máquina virtual do Azure que usará posteriormente neste laboratório.

Entre no portal do Azure .

No portal do Azure, abra o Azure Cloud Shell clicando no ícone no canto superior direito do portal do Azure.

Se solicitado a selecionar Bash ou PowerShell , selecione PowerShell .

Observação : se esta for a primeira vez que você inicia o Cloud Shell e a mensagem You have no storage montado for exibida , selecione a assinatura que está usando neste laboratório e clique em Create storage .

Na barra de ferramentas do painel Cloud Shell, clique no ícone Carregar/Baixar arquivos , no menu suspenso, clique em Carregar e carregue os arquivos az104-07-vm-template.json e az104-07-vm-parameters.json no diretório inicial do Cloud Shell.

No painel Cloud Shell, execute o seguinte para criar o grupo de recursos que hospedará a máquina virtual (substitua o espaço reservado '[Azure_region]' pelo nome de uma região do Azure onde você pretende implantar a máquina virtual do Azure)
