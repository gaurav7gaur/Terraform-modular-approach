output "rg_name" {
  value = azurerm_resource_group.RG.name
  description = "value of the resource group name"
}

output "location" {
  value = azurerm_resource_group.RG.location    
  description = "value of the resource group location"
}