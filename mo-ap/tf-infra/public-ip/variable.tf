variable "name" {
  description = "Name of the public IP"
  type        = string
  default     = "tf-mo-ap-public-ip"
  
}

variable "location" {
  description = "Location of the public IP"
  type        = string
  default     = "centralindia"
  
}

variable "rg_name" {
  description = "Name of the resource group"
  type        = string
  default     = "tf-mo-ap-rg"
  
}