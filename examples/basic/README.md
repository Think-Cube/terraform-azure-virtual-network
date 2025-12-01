# Terraform Azure Virtual Network Module

This module deploys an **Azure Virtual Network (VNet)** along with configurable **subnets**.

## Description

- The module creates a VNet in a specified Azure Resource Group and region.
- Subnets are dynamically created based on a map input, supporting multiple configurations per subnet.
- Automatic naming ensures predictable and organized network resources:

VNet: `<environment>-<vnet_name>-<region>-vnet`
Subnet: as specified in the subnet_prefix input

## Features

- Create a **VNet** with custom address space and optional DNS servers.
- Create **multiple subnets** with configurable:
  - IP address prefixes
  - Service endpoints
  - Delegations
  - Private endpoint policies
  - Private link service network policies
- Apply consistent **tags** to all network resources.

## Typical Use Cases

- Setting up network foundations for applications in Azure.
- Segregating workloads into subnets for web, database, or backend services.
- Configuring subnets for private endpoints and service delegations.
- Ensuring consistent naming and tagging across multiple environments.

## Notes

- Ensure `subnet_prefix` map includes all required keys (`name`, `ip`) for each subnet.
- Delegations and service endpoints are optional but can be configured per subnet.
- VNet name and subnets follow the module's naming convention to maintain consistency.

```
module "vnet" {
  source              = "./terraform-azure-virtual-network"
  environment         = "dev"
  region              = "westeurope"
  resource_group_name = "rg-example"
  vnet_name           = "app"
  vnet_address_space  = "10.0.0.0/16"
  vnet_custom_dns     = ["10.1.0.4", "10.1.0.5"]
  subnet_prefix = {
    subnet1 = {
      name                                          = "subnet-web"
      ip                                            = ["10.0.1.0/24"]
      service_endpoints                             = [{ service = "Microsoft.Storage" }]
      delegations                                   = [{ name = "delegation-web", service_name = "Microsoft.Web/serverFarms", actions = ["Microsoft.Network/virtualNetworks/subnets/action"] }]
      private_endpoint_network_policies             = "Enabled"
      private_link_service_network_policies_enabled = "Disabled"
    },
    subnet2 = {
      name              = "subnet-db"
      ip                = ["10.0.2.0/24"]
      service_endpoints = []
      delegations       = []
    }
  }
  default_tags = {
    environment = "dev"
    project     = "example"
  }
}
```