variable "name" {
  description = "The name of the virtual network. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the virtual network."
  type        = string
}

variable "location" {
  description = "The location/region where the virtual network is created. Changing this forces a new resource to be created."
  type        = string
}

variable "address_space" {
  description = "The address space that is used by the virtual network. You can supply more than one address space."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "dns_servers" {
  description = "List of custom DNS servers to use inside your virtual network. Unset will use default Azure-provided resolver."
  type        = list(string)
  default     = null
}

variable "bgp_community" {
  description = "The BGP community attribute in format <as-number>:<community-value>."
  type        = string
  default     = null
}

variable "edge_zone" {
  description = "Specifies the Edge Zone within the Azure Region where this Virtual Network should exist."
  type        = string
  default     = null
}

variable "flow_timeout_in_minutes" {
  description = "The flow timeout in minutes for the Virtual Network, which is used to enable connection tracking for intra-VM flows. Possible values are between 4 and 30 minutes."
  type        = number
  default     = null
}

variable "encryption" {
  description = "Optional encryption block. enforcement must be 'AllowUnencrypted' or 'DropUnencrypted'."
  type = object({
    enforcement = string
  })
  default = null
}

variable "ddos_protection_plan" {
  description = "Optional DDoS protection plan block."
  type = object({
    id     = string
    enable = bool
  })
  default = null
}

variable "subnet_prefix" {
  description = "Map of subnets with their prefixes and optional service endpoints and delegations."
  type = map(object({
    name              = string
    ip                = list(string)
    service_endpoints = optional(list(object({
      service = string
    })), [])
    delegations = optional(list(object({
      name         = string
      service_name = string
      actions      = list(string)
    })), [])
    private_endpoint_network_policies             = optional(string, null)
    private_link_service_network_policies_enabled = optional(string, null)
  }))
  default = {}
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
