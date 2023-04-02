resource "azurerm_key_vault" "mykeyvault" {
  name                        = "my-key-vault"
  location           = azurerm_resource_group.az104-06.location
  resource_group_name = azurerm_resource_group.az104-06.name
  enabled_for_disk_encryption = true

}

resource "azurerm_key_vault_secret" "az104-key" {
  name         = "my-ssh-private-key"
  value        = file("~/.ssh/id_rsa")
  content_type = "text/plain"

  key_vault_id = azurerm_key_vault.mykeyvault.id
}