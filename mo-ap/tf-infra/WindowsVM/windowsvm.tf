resource "azurerm_network_interface" "nic" {
  name = "${var.vm_name}-nic"
  location = var.location
  resource_group_name = var.rg_name
  ip_configuration {
      name = "ipconfig"
      subnet_id = var.subnet-id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id = var.pip-id != "" ? var.pip-id : null
  }
}

resource "azurerm_windows_virtual_machine" "vm" {
  name = var.vm_name
  location = var.location
  resource_group_name = var.rg_name
  size = var.size
  admin_username = var.admin_username
    admin_password = var.admin_password
    vm_agent_platform_updates_enabled = true
    network_interface_ids = [azurerm_network_interface.nic.id]
    os_disk {
        caching = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }
      source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }
}