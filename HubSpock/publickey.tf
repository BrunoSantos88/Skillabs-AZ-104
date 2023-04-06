resource "azurerm_ssh_public_key" "chave_ssh" {
  name = "chave_ssh"
  path = "~/.ssh/id_rsa.pub"
  key_data = "chave pública SSH"
}