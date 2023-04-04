# Crie um Application Load Balancer
resource "azurerm_lb" "lb_example" {
  name                = "lb-example"
  location            = azurerm_resource_group.az104-rs5.location
  resource_group_name = azurerm_resource_group.az104-rs5.name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "public-ip-config"
    public_ip_address_id = azurerm_public_ip.public_ip_example.id
  }

  backend_address_pool {
    name = "backend-pool"
  }

  # Crie uma sonda de integridade
  probe {
    name                 = "health-probe"
    protocol             = "Tcp"
    request_path         = "/"
    interval_in_seconds = 5
    number_of_probes     = 2
  }

  # Crie uma regra de balanceamento de carga
  rule {
    name                = "http-rule"
    protocol            = "Tcp"
    frontend_port       = 80
    backend_port        = 80
    frontend_ip_configuration_name = "public-ip-config"
    backend_address_pool_name      = "backend-pool"
    probe_name                      = "health-probe"
  }
}

# Crie um endereço IP público
resource "azurerm_public_ip" "public_ip_example" {
  name                = "public-ip-example"
  location            = azurerm_resource_group.az104-rs5.location
  resource_group_name = azurerm_resource_group.az104-rs5.name
  allocation_method   = "Static"
}