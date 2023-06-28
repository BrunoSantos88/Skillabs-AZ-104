resource "azurerm_availability_set" "DemoAset" {
name                = "example-aset"
location           = azurerm_resource_group.az104-08.location
resource_group_name = azurerm_resource_group.az104-08.name
}
