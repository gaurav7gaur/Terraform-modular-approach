variable "NSG_name" {
  description = "Name of the NSG"
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

variable "subnet_id" {
  description = "ID of the subnet"
  type        = string
  
}