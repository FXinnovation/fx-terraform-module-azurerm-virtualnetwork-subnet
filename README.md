# terraform-module-azurerm-virtualnetwork-subnet

## Usage

This module is used to deploy multiple subnets inside a virtual network and configure for each subnets their service endpoints and their delegations.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| resource\_group\_name | Name of the resource group where the vnet is hosted. | string | n/a | yes |
| subnets\_config | Object containing deployment information for subnets. | any | n/a | yes |
| virtual\_network\_name | Name of the virtual network where the subnets will reside in. | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| subnet\_cidr\_list | CIDR list of the created subnets |
| subnet\_ids | IDs of the created subnets |
| subnet\_names | Names list of the created subnet |
| subnets\_cidrs\_map | Map with names and CIDRs of the created subnets |
| subnets\_ids\_map | Map with names and IDs of the created subnets |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Examples

Usage example is found in the `./examples/default/` folder.

## Inspec

No Inspec tests are done for this module.
