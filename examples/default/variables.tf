#Set authentication variables
#variable "tenant_id" {
#  description = "Azure tenant Id."
#}

#variable "subscription_id" {
#  description = "Azure subscription Id."
#}

#variable "client_id" {
#  description = "Azure service principal application Id."
#}

#variable "client_secret" {
#  description = "Azure service principal application Secret."
#}

variable "resource_group_name" {
  description = "Resource group where the vnet resides."
  type        = string
}

variable "location" {
  description = "Location of the resources."
  type        = string
  default     = ""
}

variable "vnet_name" {
  description = "Name of the virtual network."
  type        = string
}

variable "vnet_address_space" {
  description = "The address space that is used by the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/8"]
}

variable "vnet_dns_servers" {
  description = "List of IP addresses of DNS servers"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags to add to the virtual network."
  default     = {}
  type        = map
}

variable "subnets_config" {
  description = "Object containing deployment information for subnets."
  type        = any
  default = {
    subnet1 = {
      name              = "subnet1"                              #(Mandatory)
      address_prefix    = "10.0.1.0/24"                          #(Mandatory)
      service_endpoints = ["Microsoft.Sql", "Microsoft.Storage"] #(Optional) delete this line for no Service Endpoints
    }
    subnet2 = {
      name           = "subnet2"     #(Mandatory)
      address_prefix = "10.0.2.0/24" #(Mandatory)
    }
  }
}

variable "network_security_groups_config" {
  description = "Object containing deployment information for network security groups."
  type        = any
  default = {
    nsg1 = {
      name = "nsg-1"
      security_rule = [
        {
          name                       = "test1"
          description                = "My Test 1"
          priority                   = 101
          direction                  = "Outbound"
          access                     = "Allow"
          protocol                   = "Tcp"
          source_port_range          = "*"
          destination_port_range     = "*"
          source_address_prefix      = "*"
          destination_address_prefix = "*"
        }
      ]
    }
  }
}

variable "route_tables_config" {
  description = "Object containing deployment information for route tables."
  type        = any
}
