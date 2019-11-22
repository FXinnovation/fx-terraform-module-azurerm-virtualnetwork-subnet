variable "resource_group_name" {
  description = "Name of the resource group where the vnet is hosted."
  type        = string
}

variable "virtual_network_name" {
  description = "Name of the virtual network where the subnets will reside in."
  type        = string
}

variable "subnets_config" {
  description = "Object containing deployment information for subnets."
  type        = any
}
