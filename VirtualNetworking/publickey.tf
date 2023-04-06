resource "azurerm_ssh_public_key" "chave_ssh" {
  name = "chave_ssh"
  path = "public.pem"
  key_data = "chave pública SSH"
}