output "NSG_name" {
  value = azurerm_network_security_group.NSG.name
  description = "NSG name"
}

output "NSG_id" {
    value = azurerm_network_security_group.NSG.id
    description = "NSG id"
}

output "nsg_rg" {
    value = azurerm_network_security_group.NSG.resource_group_name
    description = "NSG resource group"
  
}