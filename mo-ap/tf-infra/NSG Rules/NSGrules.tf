resource "azurerm_network_security_rule" "NSG_rule" {
  name                        = var.rule_name
  priority                    = var.priority
  direction                   = var.direction
  access                      = var.access
  protocol                    = var.protocol
  source_port_range           = var.source_port
  destination_port_range      = var.destination_port
  source_address_prefix       = var.sources_address
  destination_address_prefix  = var.destination_address
  resource_group_name         = var.rg_name
  network_security_group_name = var.NSG_name
}