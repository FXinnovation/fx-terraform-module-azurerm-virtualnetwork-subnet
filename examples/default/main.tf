module "az-rg-demo" {
  source   = "git::ssh://git@scm.dazzlingwrench.fxinnovation.com:2222/fxinnovation-public/terraform-module-azurerm-resource-group.git?ref=0.2.0"
  location = var.location
  name     = var.resource_group_name
  tags     = var.tags
}

module "az-vnet-demo" {
  source              = "git::ssh://git@scm.dazzlingwrench.fxinnovation.com:2222/fxinnovation-public/terraform-module-azurerm-virtualnetwork.git?ref=v0.1"
  resource_group_name = module.az-rg-demo.name
  vnet_name           = var.vnet_name
  vnet_address_space  = var.vnet_address_space
  vnet_dns_servers    = var.vnet_dns_servers
  tags                = var.tags
}

module "az-subnets-demo" {
  source               = "git::ssh://git@scm.dazzlingwrench.fxinnovation.com:2222/fxinnovation-public/terraform-module-azurerm-virtualnetwork-subnet.git?ref=v0.1"
  resource_group_name  = module.az-rg-demo.name
  virtual_network_name = module.az-vnet-demo.virtual_network_name
  subnets_config       = var.subnets_config
}

module "az-nsg-demo" {
  source                         = "git::ssh://git@scm.dazzlingwrench.fxinnovation.com:2222/fxinnovation-public/terraform-module-azurerm-networksecuritygroup.git?ref=v0.1"
  resource_group_name            = module.az-rg-demo.name
  subnets_config                 = var.subnets_config
  network_security_groups_config = var.network_security_groups_config
  subnets_ids_map                = module.az-subnets-demo.subnets_ids_map
  tags                           = var.tags
}

module "az-rt-demo" {
  source              = "git::ssh://git@scm.dazzlingwrench.fxinnovation.com:2222/fxinnovation-public/terraform-module-azurerm-routetable.git?ref=v0.1"
  resource_group_name = module.az-rg-demo.name
  subnets_config      = var.subnets_config
  route_tables_config = var.route_tables_config
  subnets_ids_map     = module.az-subnets-demo.subnets_ids_map
  tags                = var.tags
}
