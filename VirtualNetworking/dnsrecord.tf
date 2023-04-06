# Create the Azure DNS Zone for the domain
resource "azurerm_dns_zone" "contoso" {
  name                = "contoso.com"
  resource_group_name = azurerm_resource_group.az104-04.name
}

#para funcionar parametro do IP tem que esta setado.

#resource "azurerm_dns_a_record" "primary" {
 # name                = "www"
 # resource_group_name = azurerm_resource_group.az104-04.name
 #zone_name           = azurerm_dns_zone.contoso.name
  #records             = [azurerm_public_ip.mypublicip1.id] # IP Publico alterar
 # ttl                 = 300
#}

#resource "azurerm_dns_a_record" "secondary" {
 ## resource_group_name = azurerm_resource_group.az104-04.name
  #zone_name           = azurerm_dns_zone.contoso.name
 # records             = [azurerm_public_ip.mypublicip0.id] #IP Publico alterar
 # ttl                 = 300
#}