output "id" {
  description = "The virtual network ID."
  value       = azurerm_virtual_network.main.id
  sensitive   = false
}

output "name" {
  description = "The name of the virtual network."
  value       = azurerm_virtual_network.main.name
  sensitive   = false
}

output "resource_group_name" {
  description = "The name of the resource group in which the virtual network was created."
  value       = azurerm_virtual_network.main.resource_group_name
  sensitive   = false
}

output "location" {
  description = "The location/region where the virtual network was created."
  value       = azurerm_virtual_network.main.location
  sensitive   = false
}

output "address_space" {
  description = "The list of address spaces used by the virtual network."
  value       = azurerm_virtual_network.main.address_space
  sensitive   = false
}

output "subnets" {
  description = "Map of subnet names to their IDs."
  value       = { for k, v in azurerm_subnet.main : k => v.id }
  sensitive   = false
}
