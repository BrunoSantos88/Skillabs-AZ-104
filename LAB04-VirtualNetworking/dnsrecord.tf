# Create the Azure DNS Zone for the domain
resource "azurerm_dns_zone" "contoso" {
  name                = "contoso.com"
  resource_group_name = azurerm_resource_group.az104-04.name
}

resource "azurerm_dns_a_record" "primary" {
  name                = "www"
  resource_group_name = azurerm_resource_group.az104-04.name
  zone_name           = azurerm_dns_zone.contoso.name
<<<<<<< HEAD
  records             = ["IP"]
=======
  records             = ["IPPublico"]
>>>>>>> 866c01e276cd674d48d9648429c5d0d27038a36c
  ttl                 = 300
}

# Create an A record for the secondary VM
resource "azurerm_dns_a_record" "secondary" {
  name                = "www"
  resource_group_name = azurerm_resource_group.az104-04.name
  zone_name           = azurerm_dns_zone.contoso.name
<<<<<<< HEAD
  records             = ["IP"]
=======
  records             = ["IPpublico"]
>>>>>>> 866c01e276cd674d48d9648429c5d0d27038a36c
  ttl                 = 300
}
