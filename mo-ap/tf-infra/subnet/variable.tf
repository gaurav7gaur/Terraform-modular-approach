variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
  
}

variable "rg_name" {
  description = "Name of the resource group"
  type        = string
  
}

variable "location" {
  description = "Location of the Vnet"
  type        = string
  default     = "centralindia"
  
}

variable "subnet_address_space" {
  description = "Address space of the subnet"
  type        = list(string)
  
}

variable "vnet_name" {
  description = "Name of vnet"
  
}