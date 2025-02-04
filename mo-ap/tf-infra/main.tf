terraform {
  backend "azurerm" {
    resource_group_name  = "backend-rg"
    storage_account_name = "tfbackendgglearn"
    container_name       = "tf-backend"
    key                  = "backend.tfstate"

  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.16.0"
    }
  }

}

provider "azurerm" {
  # Configuration options
  features {
    /*virtual_machine {
      skip_shutdown_and_force_delete = true
    }*/
  }

  subscription_id = "7a200d71-c12e-4edd-a634-3bb2ff9c7144"
  /*
  //client_id = "de20e3cd-6d07-42c5-84df-84ae74cdc7ab"
  client_id = "ae721cbb-49a9-41ff-a460-212db29c5718"

  client_secret = "FII8Q~dhhYauks_Np1z2MI95nVOOJT79PkW4Sa~K"

  tenant_id = "a6859188-9a5a-4be5-a3dc-4072291d2fe1"
*/
}

variable "type" {
  description = "Type of the infra"
  type        = string
  default     = "tf-mo-ap"

}

module "RG" {
  source   = "./RG"
  rg_name  = "${var.type}-rg01"
  location = "centralindia"
}

module "rg2" {
  source   = "./RG"
  rg_name  = "${var.type}-rg02"
  location = "southindia"

}
#commenting all below to destroy the resources


module "VNET1" {
  source        = "./VNet"
  rg_name       = module.RG.rg_name
  vnet_name     = "${var.type}-vnet"
  address_space = ["22.0.0.0/20"]
  location      = module.RG.location
}

module "Vnet2" {
  source        = "./VNet"
  rg_name       = module.rg2.rg_name
  vnet_name     = "${var.type}-vnet2"
  address_space = ["21.0.0.0/20"]
}

module "subnet1" {
  source               = "./subnet"
  subnet_name          = "subnet1"
  rg_name              = module.VNET1.vnet_rg
  location             = module.VNET1.vnet_location
  subnet_address_space = ["22.0.0.0/24"]
  vnet_name            = module.VNET1.vnet_name
}

module "subnet2-1" {
  source               = "./subnet"
  subnet_name          = "subnet1"
  rg_name              = module.Vnet2.vnet_rg
  location             = module.Vnet2.vnet_location
  subnet_address_space = ["21.0.0.0/24"]
  vnet_name            = module.Vnet2.vnet_name
}

module "NSG1" {
  source    = "./NSG"
  NSG_name  = "${var.type}-nsg"
  rg_name   = module.RG.rg_name
  location  = module.RG.location
  subnet_id = module.subnet1.subnet_id
}

module "nsg_rule1" {
  source              = "./NSG Rules"
  NSG_name            = module.NSG1.NSG_name
  rg_name             = module.NSG1.nsg_rg
  rule_name           = "AllowSSH"
  priority            = 150
  direction           = "Inbound"
  access              = "Allow"
  protocol            = "Tcp"
  source_port         = "*"
  destination_port    = "22"
  sources_address     = "*"
  destination_address = "*"
}

module "pip" {
  source   = "./public-ip"
  name     = "${var.type}-pip"
  rg_name  = module.RG.rg_name
  location = module.RG.location
}

module "linuxvm1" {
  source         = "./LinuxVM"
  rg_name        = module.RG.rg_name
  location       = module.RG.location
  subnet_id      = module.subnet1.subnet_id
  linux_vm_name  = "${var.type}-linuxvm1"
  server_size    = "Standard_B1s"
  admin_username = "azureuser"
  admin_password = "Password@1234"
  public-ip-id   = module.pip.public-ip-id
}

module "linuxvm2" {
  source         = "./LinuxVM"
  rg_name        = module.RG.rg_name
  location       = module.RG.location
  subnet_id      = module.subnet1.subnet_id
  linux_vm_name  = "${var.type}-linuxvm2"
  server_size    = "Standard_B1s"
  admin_username = "azureuser"
  admin_password = "Password@1234"
}

module "lb-pip" {
  source   = "./public-ip"
  name     = "${var.type}-lb-pip"
  rg_name  = module.RG.rg_name
  location = module.RG.location
}

module "lb" {
  source             = "./load balancer"
  lb-name            = "${var.type}-lb"
  lb-rg              = module.RG.rg_name
  lb-location        = module.RG.location
  pip-id             = module.lb-pip.public-ip-id
  backend-pool-name  = "${var.type}-backend-pool"
  probe-name         = "probe"
  probe-port         = 80
  rule-name          = "rule"
  rule-frontend-port = 80
  rule-backend-port  = 80
}

module "lb-assoc1" {
  source          = "./load balacer backend association"
  nic-id          = module.linuxvm1.pvt-ip-id
  ip-config-name  = module.linuxvm1.nic-ipconfig-name
  backend-pool-id = module.lb.backend-pool-id
}

module "lb-assoc2" {
  source          = "./load balacer backend association"
  nic-id          = module.linuxvm2.pvt-ip-id
  ip-config-name  = module.linuxvm2.nic-ipconfig-name
  backend-pool-id = module.lb.backend-pool-id
}