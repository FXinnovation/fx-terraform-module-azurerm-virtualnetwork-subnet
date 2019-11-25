# terraform-example

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| client\_id | Azure service principal application Id. | string | n/a | yes |
| client\_secret | Azure service principal application Secret. | string | n/a | yes |
| location | Location of the resources. | string | `"canadacentral"` | no |
| network\_security\_groups\_config | Object containing deployment information for network security groups. | any | `{ "nsg1": [ { "name": "nsg-1", "security_rules": [ { "access": "Allow", "description": "My Test 1", "destination_address_prefix": "*", "destination_port_range": "*", "direction": "Outbound", "name": "test1", "priority": 101, "protocol": "Tcp", "source_address_prefix": "*", "source_port_range": "*" }, { "access": "Allow", "description": "My Test 2", "destination_address_prefixes": [ "192.168.1.5", "192.168.1.6" ], "destination_port_range": "*", "direction": "Outbound", "name": "test2", "priority": 102, "protocol": "Tcp", "source_address_prefix": "*", "source_port_range": "*" }, { "access": "Allow", "description": "My Test 3", "destination_address_prefixes": [ "192.168.1.5", "192.168.1.6" ], "destination_port_ranges": [ "22", "3389" ], "direction": "Outbound", "name": "test3", "priority": 103, "protocol": "Tcp", "source_address_prefix": "*", "source_port_range": "*" } ] } ] }` | no |
| resource\_group\_name | Resource group where the vnet resides. | string | `"fxcozca1dgenrg002"` | no |
| route\_tables\_config | Object containing deployment information for route tables. | any | `{ "rt1": [ { "disable_bgp_route_propagation": false, "name": "rt1", "routes": [ { "address_prefix": "8.8.8.8/32", "name": "tmp", "next_hop_type": "None" }, { "address_prefix": "192.168.1.0/24", "name": "tmp2", "next_hop_type": "None" }, { "address_prefix": "192.168.2.0/24", "name": "tmp3", "next_hop_in_ip_address": "10.0.1.4", "next_hop_type": "VirtualAppliance" } ] } ] }` | no |
| subnets\_config | Object containing deployment information for subnets. | any | `{ "gatewaysubnet": [ { "address_prefix": "10.0.0.0/24", "name": "GatewaySubnet" } ], "subnet1": [ { "address_prefix": "10.0.1.0/24", "name": "Subnet1", "nsg_key": "nsg1", "rt_key": "rt1", "service_endpoints": [ "Microsoft.Sql", "Microsoft.Storage" ] } ], "subnet2": [ { "address_prefix": "10.0.2.0/24", "name": "Subnet2", "nsg_key": "nsg1", "rt_key": "rt1", "service_endpoints": [ "Microsoft.Sql" ] } ], "subnet3": [ { "address_prefix": "10.0.3.0/24", "delegation": [ { "name": "acctestdelegation", "service_delegation": [ { "actions": [ "Microsoft.Network/virtualNetworks/subnets/action" ], "name": "Microsoft.ContainerInstance/containerGroups" } ] } ], "name": "Subnet3", "service_endpoints": [ "Microsoft.Sql" ] } ] }` | no |
| subscription\_id | Azure subscription Id. | string | n/a | yes |
| tags | Tags to add to the virtual network. | map | `{ "FXDepartment": "Cloud", "FXOwner": "Test user", "FXProjet": "FXCO" }` | no |
| tenant\_id | Azure tenant Id. | string | n/a | yes |
| vnet\_address\_space | The address space that is used by the virtual network | list(string) | `[ "10.0.0.0/16" ]` | no |
| vnet\_dns\_servers | List of IP addresses of DNS servers | list(string) | `[ "8.8.8.8", "8.8.4.4" ]` | no |
| vnet\_name | Name of the virtual network. | string | `"fxcozca1dgenvn001"` | no |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
