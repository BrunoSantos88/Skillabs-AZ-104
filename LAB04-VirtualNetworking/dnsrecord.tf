# Create the Azure DNS Zone for the domain
resource "azurerm_dns_zone" "contoso" {
  name                = "contoso.com"
  resource_group_name = azurerm_resource_group.az104-04.name
}

resource "azurerm_dns_a_record" "example" {
  name                = "vm1"
  zone_name           = azurerm_dns_zone.contoso.id
  resource_group_name = azurerm_resource_group.az104-04.name
  ttl                 = 300
  records             = [azurerm_network_interface.vm00.id]

  depends_on = [
    azurerm_network_interface.vm00,
  ]
}