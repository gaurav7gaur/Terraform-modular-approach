output "backend-pool-id" {
  value = azurerm_lb_backend_address_pool.lb_backend_pool.id
  description = "value of the backend pool id"
  
}