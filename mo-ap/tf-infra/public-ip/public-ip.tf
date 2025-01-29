resource "azurerm_public_ip" "public-ip" {
  name = var.name
    location = var.location
    resource_group_name = var.rg_name
    allocation_method = "Static"
}