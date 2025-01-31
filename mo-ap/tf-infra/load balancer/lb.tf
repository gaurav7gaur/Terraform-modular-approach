resource "azurerm_lb" "lb" {
  name = var.lb-name
    resource_group_name = var.lb-rg
    location            = var.lb-location
    sku = "Standard"
    frontend_ip_configuration {
        name                 = "lb-pi"
        public_ip_address_id = var.pip-id
    }
}

resource "azurerm_lb_backend_address_pool" "lb_backend_pool" {
  name = var.backend-pool-name
  loadbalancer_id = azurerm_lb.lb.id
}

resource "azurerm_lb_probe" "lb-probe" {
  name = var.probe-name
  port = var.probe-port
  loadbalancer_id = azurerm_lb.lb.id
  protocol = "Tcp"
}

resource "azurerm_lb_rule" "lb-rule" {
  name = var.rule-name
  frontend_port = var.rule-frontend-port
  backend_port = var.rule-backend-port
  frontend_ip_configuration_name = azurerm_lb.lb.frontend_ip_configuration[0].name
  loadbalancer_id = azurerm_lb.lb.id
  protocol = "Tcp"
}