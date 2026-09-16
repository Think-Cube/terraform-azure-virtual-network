resource "azurerm_virtual_network" "main" {
  name                    = var.name
  location                = data.azurerm_resource_group.rg.location
  resource_group_name     = data.azurerm_resource_group.rg.name
  address_space           = var.address_space
  dns_servers             = var.dns_servers
  bgp_community           = var.bgp_community
  edge_zone               = var.edge_zone
  flow_timeout_in_minutes = var.flow_timeout_in_minutes
  tags                    = var.tags

  dynamic "encryption" {
    for_each = var.encryption != null ? [var.encryption] : []
    content {
      enforcement = encryption.value.enforcement
    }
  }

  dynamic "ddos_protection_plan" {
    for_each = var.ddos_protection_plan != null ? [var.ddos_protection_plan] : []
    content {
      id     = ddos_protection_plan.value.id
      enable = ddos_protection_plan.value.enable
    }
  }
}
