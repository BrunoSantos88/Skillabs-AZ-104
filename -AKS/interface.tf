# interface de Rede VM
resource "azurerm_network_interface" "jenkinVm" {
  name                = "jenkins-nic"
  location            = var.location
  resource_group_name = var.resoucegroup
  enable_ip_forwarding = true

   ip_configuration {
    name                          = "jenkinsIP"
    subnet_id                     = azurerm_subnet.subnet0.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.myjenkinsip.id
  }

  tags = {
    environment = "az106-04-vm0"
    }
}


resource "azurerm_public_ip" "myjenkinsip" {
  name                = "my-jenkins-ip"
  location            = var.location
  resource_group_name = var.resoucegroup
  allocation_method   = "Dynamic"
  ip_version          = "IPv4"
}
