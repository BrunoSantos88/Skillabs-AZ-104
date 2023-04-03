# Create the Azure DNS Zone for the domain
resource "azurerm_dns_zone" "contoso" {
  name                = "contoso.org.net"
  resource_group_name = azurerm_resource_group.az104-04.name
}