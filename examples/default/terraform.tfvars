resource_group_name = "fxcozca1dgenrg001"
location            = "canadacentral"
vnet_name           = "fxcozca1dgenvn001"
vnet_address_space  = ["10.0.0.0/16"]
vnet_dns_servers    = ["8.8.8.8", "8.8.4.4"]
subnets_config = {
  gatewaysubnet = {
    name           = "GatewaySubnet"
    address_prefix = "10.0.0.0/24"
  }
  subnet1 = {
    name              = "Subnet1"
    address_prefix    = "10.0.1.0/24"
    nsg_key           = "nsg1"
    rt_key            = "rt1"
    service_endpoints = ["Microsoft.Sql", "Microsoft.Storage"]
  },
  subnet2 = {
    name              = "Subnet2"
    address_prefix    = "10.0.2.0/24"
    nsg_key           = "nsg1"
    rt_key            = "rt1"
    service_endpoints = ["Microsoft.Sql"]
  }
  subnet3 = {
    name              = "Subnet3"
    address_prefix    = "10.0.3.0/24"
    service_endpoints = ["Microsoft.Sql"]
    delegation = [
      {
        name = "acctestdelegation" #(Required) A name for this delegation.
        service_delegation = [
          {
            name    = "Microsoft.ContainerInstance/containerGroups"        # (Required) The name of service to delegate to. Possible values include Microsoft.BareMetal/AzureVMware, Microsoft.BareMetal/CrayServers, Microsoft.Batch/batchAccounts, Microsoft.ContainerInstance/containerGroups, Microsoft.Databricks/workspaces, Microsoft.HardwareSecurityModules/dedicatedHSMs, Microsoft.Logic/integrationServiceEnvironments, Microsoft.Netapp/volumes, Microsoft.ServiceFabricMesh/networks, Microsoft.Sql/managedInstances, Microsoft.Sql/servers, Microsoft.Web/hostingEnvironments and Microsoft.Web/serverFarms.
            actions = ["Microsoft.Network/virtualNetworks/subnets/action"] # (Required) A list of Actions which should be delegated. Possible values include Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action, Microsoft.Network/virtualNetworks/subnets/action and Microsoft.Network/virtualNetworks/subnets/join/action.
          },
        ]
      },
    ]
  }
}
network_security_groups_config = {
  nsg1 = {
    name = "nsg-1"
    security_rules = [
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
      },
      {
        name                         = "test2"
        description                  = "My Test 2"
        priority                     = 102
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "*"
        source_address_prefix        = "*"
        destination_address_prefixes = ["192.168.1.5", "192.168.1.6"]
      },
      {
        name                         = "test3"
        description                  = "My Test 3"
        priority                     = 103
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_ranges      = ["22", "3389"]
        source_address_prefix        = "*"
        destination_address_prefixes = ["192.168.1.5", "192.168.1.6"]
      }
    ]
  }
}
route_tables_config = {
  rt1 = {
    name                          = "rt1"
    disable_bgp_route_propagation = false
    routes = [
      {
        name           = "tmp"
        address_prefix = "8.8.8.8/32"
        next_hop_type  = "None"
      },
      {
        name           = "tmp2"
        address_prefix = "192.168.1.0/24"
        next_hop_type  = "None"
      },
      {
        name                   = "tmp3"
        address_prefix         = "192.168.2.0/24"
        next_hop_type          = "VirtualAppliance"
        next_hop_in_ip_address = "10.0.1.4"
      }
    ]
  }
}
tags = {
  FXOwner      = "Test user"
  FXProjet     = "FXCO"
  FXDepartment = "Cloud"
}
