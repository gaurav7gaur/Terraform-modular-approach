variable "nic-id" {
  description = "The ID of the Network Interface to associate with the Backend Address Pool"
  type        = string
  
}

variable "ip-config-name" {
  description = "The name of the IP Configuration to associate with the Backend Address Pool"
  type        = string
  
}

variable "backend-pool-id" {
  description = "The ID of the Backend Address Pool to associate with the Network Interface"
  type        = string
}