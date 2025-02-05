variable "vm_name" {
    description = "Name of the virtual machine"
    type        = string
    default     = "vm"
  
}

variable "location" {
    description = "Location of the resources"
    type        = string
    default     = "northeurope"
  
}

variable "rg_name" {
    description = "Name of the resource group"
    type        = string
    default     = "rg"
  
}

variable "admin_username" {
    description = "Admin username for the virtual machine"
    type        = string
  
}
variable "admin_password" {
    description = "Admin password for the virtual machine"
    type        = string
  
}
/*
variable "nic-id" {
    description = "ID of the network interface"
    type        = string
    default     = "nic"
  
}
*/
variable "subnet-id" {
    description = "ID of the subnet"
    type        = string  
}

variable "pip-id" {
    description = "ID of the public IP"
    type        = string
    default     = ""
  
}

variable "size" {
  description = "size of the vM"
}