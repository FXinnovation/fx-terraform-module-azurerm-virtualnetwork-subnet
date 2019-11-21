variable "resource_group_name" {
  description = "Name of the resource group where the vnet is hosted."
  type        = string
}

variable "virtual_network_name" {
  description = "Name of the virtual network where the subnets will reside in."
  type        = string
}

variable "subnetsCfg" {
  description = "Object containing deployment information for subnets."
  type        = any
  default = {
    subnet1 = {
      name              = "subnet1"                              #(Mandatory)
      address_prefix    = "10.0.1.0/24"                          #(Mandatory)
      nsg_key           = "nsg1"                                 #(Optional) delete this line for no NSG
      rt_key            = "rt1"                                  #(Optional) delete this line for no Route Table
      service_endpoints = ["Microsoft.Sql", "Microsoft.Storage"] #(Optional) delete this line for no Service Endpoints
    }
    subnet2 = {
      name           = "subnet2"     #(Mandatory)
      address_prefix = "10.0.2.0/24" #(Mandatory)
    }
  }
}
