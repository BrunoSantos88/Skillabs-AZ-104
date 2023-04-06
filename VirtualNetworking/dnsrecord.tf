# Create the Azure DNS Zone for the domain
resource "azurerm_dns_zone" "contoso" {
  name                = "contoso.com"
  resource_group_name = azurerm_resource_group.az104-04.name
}

resource "azurerm_dns_a_record" "primary" {
  name                = "www"
  resource_group_name = azurerm_resource_group.az104-04.name
  zone_name           = azurerm_dns_zone.contoso.name
  records             = ["IP"] # IP Publico alterar
  ttl                 = 300
}

resource "azurerm_dns_a_record" "secondary" {
  name                = "www"
  resource_group_name = azurerm_resource_group.az104-04.name
  zone_name           = azurerm_dns_zone.contoso.name
  records             = ["IP"] #IP Publico alterar
  ttl                 = 300
}
