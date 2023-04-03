# Create the Azure DNS Zone for the domain
resource "azurerm_dns_zone" "contoso" {
  name                = "contoso.com"
  resource_group_name = azurerm_resource_group.az104-04.name
}

# Create an A record for the primary VM
resource "azurerm_dns_a_record" "primary" {
  name                = "www"
  zone_name           = azurerm_dns_zone.contoso.name
  records             = [azurerm_public_ip.mypublicip0.id]
  ttl                 = 300
}

# Create an A record for the secondary VM
resource "azurerm_dns_a_record" "secondary" {
  name                = "www"
  zone_name           = azurerm_dns_zone.contoso.name
  records             = [azurerm_public_ip.mypublicip1.id]
  ttl                 = 300
}