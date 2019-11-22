resource "azurerm_subnet" "this" {
  for_each             = var.subnets_config
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  name                 = each.value["name"]
  address_prefix       = each.value["address_prefix"]
  service_endpoints    = lookup(each.value, "service_endpoints", null)

  // Avoid collision with subnet_association and route_table_association
  // Can be removed when azurerm v2.0 will be released
  lifecycle {
    ignore_changes = [route_table_id, network_security_group_id]
  }
}
