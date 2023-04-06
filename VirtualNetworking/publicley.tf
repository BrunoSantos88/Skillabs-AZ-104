resource "azurerm_ssh_public_key" "example" {
  name                = "example"
  location           = azurerm_resource_group.az104-04.location
  resource_group_name = azurerm_resource_group.az104-04.name
  public_key          = file("~/.ssh/id_rsa.pub")
}