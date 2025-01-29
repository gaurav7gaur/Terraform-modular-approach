variable "NSG_name" {
  description = "Name of the NSG"
  type        = string
  
}

variable "rg_name" {
  description = "Name of the resource group"
  type        = string
  
}

variable "rule_name" {
  description = "Name of the rule"
  type        = string
  
}
variable "priority" {
  description = "Priority of the rule"
  type        = number
  
}

variable "direction" {
  description = "Direction of the rule"
  type        = string
  
}

variable "access" {
  description = "Access of the rule"
  type        = string
  
}

variable "protocol" {
  description = "Protocol of the rule"
  type        = string
  
}
variable "source_port" {
  description = "Source port of the rule"
  type        = string
  
}
variable "destination_port" {
  description = "Destination port of the rule"
  type        = string
  
}
variable "sources_address" {
  description = "Source address of the rule"
  type        = string
  
}
variable "destination_address" {
  description = "Destination address of the rule"
  type        = string
  
}