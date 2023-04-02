resource "azurerm_key_vault_secret" "az104-key" {
  name         = "my-ssh-private-key"
  value        = file("~/.ssh/id_rsa")
  content_type = "text/plain"

  key_vault_id = azurerm_key_vault.example.id
}