
resource "azurerm_subnet" "this_subnets" {
  depends_on                = [azurerm_virtual_network.this]
  for_each                  = var.subnets
  name                      = each.value["name"]
  resource_group_name       = data.azurerm_resource_group.network.name
  address_prefix            = each.value["address_prefix"]
  service_endpoints         = lookup(each.value, "service_endpoints", null)
  route_table_id            = lookup(each.value, "rt_key", null) == null ? null : lookup(azurerm_route_table.rts, each.value["rt_key"], null)["id"]
  network_security_group_id = lookup(each.value, "nsg_key", null) == null ? null : lookup(azurerm_network_security_group.nsgs, each.value["nsg_key"], null)["id"]
}
