resource "azurerm_network_interface_backend_address_pool_association" "lb-assocaiate" {
  network_interface_id = var.nic-id
  ip_configuration_name = var.ip-config-name
  backend_address_pool_id = var.backend-pool-id
}