variable "rg_name" {
  description = "Name of the resource group"
  type        = string
  
}

variable "location" {
  description = "Location of the Vnet"
  type        = string
  default     = "centralindia"
  
}


variable "subnet_id" {
  description = "ID of the subnet"
  type        = string
  
}

variable "linux_vm_name" {
  description = "Name of the Linux VM"
  type        = string
  
}

variable "server_size" {
  description = "Size of the VM"
  type        = string
  default     = "Standard_B1s"
  
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  
}

variable "admin_password" {
  description = "Admin password for the VM"
  type        = string
  
}

variable "public-ip-id" {
  description = "ID of the public IP"
  type        = string
  default = ""
}