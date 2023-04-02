resource "azurerm_key_vault" "example" {
  name                = "my-key-vault"
  location            = azurerm_resource_group.az104-06.location
  resource_group_name = azurerm_resource_group.az104-06.name

}

resource "azurerm_key_vault_secret" "example" {
  name         = "my-ssh-private-key"
  value        = file("~/.ssh/id_rsa")
  content_type = "application/octet-stream"
  key_vault_id = azurerm_key_vault.example.id
}