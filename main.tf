#####
# Resources
#####

resource "azurerm_subnet" "this" {
  for_each             = var.enabled ? var.subnets_config : null
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

  dynamic "delegation" {
    for_each = lookup(each.value, "delegation", [])
    content {
      name = lookup(delegation.value, "name", null)
      dynamic "service_delegation" {
        for_each = lookup(delegation.value, "service_delegation", [])
        content {
          name    = lookup(service_delegation.value, "name", null)    # (Required) The name of service to delegate to. Possible values include Microsoft.BareMetal/AzureVMware, Microsoft.BareMetal/CrayServers, Microsoft.Batch/batchAccounts, Microsoft.ContainerInstance/containerGroups, Microsoft.Databricks/workspaces, Microsoft.HardwareSecurityModules/dedicatedHSMs, Microsoft.Logic/integrationServiceEnvironments, Microsoft.Netapp/volumes, Microsoft.ServiceFabricMesh/networks, Microsoft.Sql/managedInstances, Microsoft.Sql/servers, Microsoft.Web/hostingEnvironments and Microsoft.Web/serverFarms.
          actions = lookup(service_delegation.value, "actions", null) # (Required) A list of Actions which should be delegated. Possible values include Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action, Microsoft.Network/virtualNetworks/subnets/action and Microsoft.Network/virtualNetworks/subnets/join/action.
        }
      }
    }
  }
}
