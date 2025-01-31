output "server_name" {
  value = azurerm_linux_virtual_machine.LinuxVM.name
  description = "server_name"
  
}

output "pvt-ip-id" {
  value = azurerm_network_interface.NIC.id
  description = "pvt-ip-id"
  
}

output "nic-ipconfig-name" {
  value = azurerm_network_interface.NIC.ip_configuration[0].name
  description = "name of ip-config"
}