variable "vmss-name" {
  description = "name of vmss"
  type = string
}

variable "location" {
  
}

variable "rg-name" {
  
}

variable "sku" {
  
}

variable "instances" {
  type = number
}

variable "username" {
  
}

variable "Password" {
  sensitive = true
}

variable "source-image-sku" {
  default = "2022-Datacenter-Server-Core"
}

variable "subnet-id" {
  
}