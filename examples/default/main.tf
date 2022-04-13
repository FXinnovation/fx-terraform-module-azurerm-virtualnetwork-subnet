module "az_rg_demo" {
  source   = "github.com/FXinnovation/fx-terraform-module-azurerm-resource-group.git?ref=0.2.0"
  location = var.location
  name     = var.resource_group_name
  tags     = var.tags
}

module "az_vnet_demo" {
  source              = "github.com/FXinnovation/fx-terraform-module-azurerm-virtualnetwork.git?ref=v0.2"
  resource_group_name = module.az_rg_demo.name
  vnet_name           = var.vnet_name
  vnet_address_space  = var.vnet_address_space
  vnet_dns_servers    = var.vnet_dns_servers
  tags                = var.tags
}

module "az_subnets_demo" {
  source               = "../../"
  resource_group_name  = module.az_rg_demo.name
  virtual_network_name = module.az_vnet_demo.virtual_network_name
  subnets_config       = var.subnets_config
}

module "az_nsg_demo" {
  source                         = "github.com/FXinnovation/fx-terraform-module-azurerm-networksecuritygroup.git?ref=v0.2"
  resource_group_name            = module.az_rg_demo.name
  subnets_config                 = var.subnets_config
  network_security_groups_config = var.network_security_groups_config
  subnets_ids_map                = module.az_subnets_demo.subnets_ids_map
  tags                           = var.tags
}

module "az_rt_demo" {
  source              = "github.com/FXinnovation/fx-terraform-module-azurerm-routetable.git?ref=v0.2"
  resource_group_name = module.az_rg_demo.name
  subnets_config      = var.subnets_config
  route_tables_config = var.route_tables_config
  subnets_ids_map     = module.az_subnets_demo.subnets_ids_map
  tags                = var.tags
}
