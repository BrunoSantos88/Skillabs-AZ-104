# Create the Azure DNS Zone for the domain
resource "azurerm_dns_zone" "contoso" {
  name                = "contoso.com"
  resource_group_name = azurerm_resource_group.az104-04.name
}

resource "azurerm_dns_a_record" "primary" {
  name                = "www"
  zone_name           = azurerm_dns_zone.contoso.name
  records             = ["10.40.1.4"]
  ttl                 = 300
}

# Create an A record for the secondary VM
resource "azurerm_dns_a_record" "secondary" {
  name                = "www"
  zone_name           = azurerm_dns_zone.contoso.name
  records             = ["10.40.0.4"]
  ttl                 = 300
}