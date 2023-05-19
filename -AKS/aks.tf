resource "azurerm_kubernetes_cluster" "example" {
  name                = "aks1"
  location            = var.location
  resource_group_name = var.resoucegroup
  dns_prefix          = "exampleaks1"

  default_node_pool {
    name       = "aks"
    node_count = 2
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}


output "kube_config" {
  value = azurerm_kubernetes_cluster.example.kube_config_raw

  sensitive = true
}