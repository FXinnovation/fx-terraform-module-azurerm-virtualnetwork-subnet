output "subnet_ids" {
  description = "IDs of the created subnets"
  value       = [for x in azurerm_subnet.this : x.id]
}

output "subnet_names" {
  description = "Names list of the created subnet"
  value       = [for x in azurerm_subnet.this : x.name]
}

output "subnets_ids_map" {
  description = "Map with names and IDs of the created subnets"
  value       = zipmap([for x in azurerm_subnet.this : x.name], [for x in azurerm_subnet.this : x.id])
}

output "subnet_cidr_list" {
  description = "CIDR list of the created subnets"
  value       = [for x in azurerm_subnet.this : x.address_prefix]
}

output "subnets_cidrs_map" {
  description = "Map with names and CIDRs of the created subnets"
  value       = zipmap([for x in azurerm_subnet.this : x.name], [for x in azurerm_subnet.this : x.address_prefix])
}
