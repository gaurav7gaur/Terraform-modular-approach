resource "azurerm_network_interface" "NIC" {
    name                = "${var.linux_vm_name}-NIC"
    location            = var.location
    resource_group_name = var.rg_name
    
    ip_configuration {
        name                          = "ipconfig"
        subnet_id                     = var.subnet_id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = var.public-ip-id != "" ? var.public-ip-id : null
    }
}

resource "azurerm_linux_virtual_machine" "LinuxVM" {
  name                = var.linux_vm_name
  resource_group_name = var.rg_name
    location            = var.location
    size                = var.server_size
    admin_username      = var.admin_username
    admin_password      = var.admin_password
    disable_password_authentication = false
    
    network_interface_ids = [azurerm_network_interface.NIC.id]
    os_disk {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
        
    }
    source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

}