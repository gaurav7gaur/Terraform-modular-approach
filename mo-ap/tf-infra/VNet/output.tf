output "vnet_name" {
  value = azurerm_virtual_network.VNet.name
  description = "value of the virtual network name"
  
}

output "Vnet_address_space" {
    value = azurerm_virtual_network.VNet.address_space
    description = "value of the virtual network address space"
}

output "vnet_rg" {
    value = azurerm_virtual_network.VNet.resource_group_name
    description = "value of the virtual network resource group"
  
}

output "vnet_location" {
    value = azurerm_virtual_network.VNet.location
    description = "value of the virtual network location"
  
}