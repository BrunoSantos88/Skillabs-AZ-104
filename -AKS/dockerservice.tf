resource "azurerm_container_group" "jenkinscontainer" {
  name                = "JenkinServer"
  location            = var.location
  resource_group_name = var.resoucegroup
  ip_address_type     = "Public"
  os_type             = "Linux"

   container {
    name   = "jenkins"
    image  = "brunosantos88/jenkinslinux:v1"
    cpu    = "2"
    memory = "4"

    ports {
      port     = 8080
      protocol = "TCP"
    }
  }

  container {
    name   = "jenkins"
    image  = "jenkins/agent"
    cpu    = "0.5"
    memory = "2.0"

    ports {
      port     = 5000
      protocol = "TCP"
    }
  }

  tags = {
    environment = "testing"

  }
}