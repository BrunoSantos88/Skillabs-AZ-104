resource "azurerm_container_group" "container" {
  name                = "jenkins"
  location            = var.location
  resource_group_name = var.resoucegroup
  ip_address_type     = "Public"
  os_type             = "Linux"

  container {
    name   = "jenkinserver"
    image  = "jenkins/jenkins"
    cpu    = "2"
    memory = "2048"

    ports {
      port     = 8080
      protocol = "TCP"
    }
  }
}