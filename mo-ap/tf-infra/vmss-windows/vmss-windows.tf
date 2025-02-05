resource "azurerm_windows_virtual_machine_scale_set" "vmss-win" {
  name = var.vmss-name
  resource_group_name = var.rg-name
  location = var.location
  sku = var.sku
  instances = var.instances
  admin_username = var.username
  admin_password = var.Password
  computer_name_prefix = "vm-"

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = var.source-image-sku
    version   = "latest"
  }
os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
  network_interface {
    name = "${var.vmss-name}-nic"
    primary = true
    ip_configuration {
      name = "internal"
      primary = true
      subnet_id = var.subnet-id
    }
  }
}