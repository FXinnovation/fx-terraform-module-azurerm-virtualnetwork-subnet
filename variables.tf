
variable "subnets" {
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
