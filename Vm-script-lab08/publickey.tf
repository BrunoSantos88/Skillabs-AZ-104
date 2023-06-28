resource "azurerm_ssh_public_key" "chave_ssh" {
  name = "chave_ssh"
  path = "~/.ssh/id_rsa.pub"
  location           = azurerm_resource_group.az104-08.location
  resource_group_name = azurerm_resource_group.az104-08.name
}