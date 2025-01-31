variable "lb-name" {
  description = "Name of the Load Balancer"
  type        = string
  
}

variable "lb-rg" {
  description = "Resource Group Name"
  type        = string
  
}

variable "lb-location" {
  description = "Location of the Load Balancer"
  type        = string
  
}

variable "pip-id" {
  description = "Public IP ID"
  type        = string
  
}

variable "backend-pool-name" {
  description = "Name of the Backend Pool"
  type        = string
  
}

variable "probe-name" {
  description = "Name of the Probe"
  type        = string
  
}

variable "probe-port" {
  description = "Port of the Probe"
  type        = number
  
}

variable "rule-name" {
  description = "Name of the Rule"
  type        = string
  
}

variable "rule-frontend-port" {
  description = "Frontend Port of the Rule"
  type        = number
  
}

variable "rule-backend-port" {
  description = "Backend Port of the Rule"
  type        = number
  
}