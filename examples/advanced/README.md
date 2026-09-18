# Example: Advanced — Azure Virtual Network

VNet with encryption enforcement, DDoS protection plan, and four purpose-specific subnets with delegations and service endpoints.

```hcl
module "vnet" {
  source = "github.com/Think-Cube/terraform-azure-virtual-network?ref=v1.0.0"

  name                = "vnet-myapp-prod"
  resource_group_name = "rg-example"
  location            = "West Europe"

  address_space = ["10.0.0.0/8"]
  dns_servers   = ["10.0.0.4", "10.0.0.5"]

  encryption = {
    enforcement = "AllowUnencrypted"
  }

  ddos_protection_plan = {
    id     = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-ddos/providers/Microsoft.Network/ddosProtectionPlans/ddos-plan"
    enable = true
  }

  subnet_prefix = {
    web = {
      name = "snet-web"
      ip   = ["10.1.0.0/24"]
      service_endpoints = [
        { service = "Microsoft.Storage" },
        { service = "Microsoft.Sql" }
      ]
      private_endpoint_network_policies = "Disabled"
    }
    app = {
      name = "snet-app"
      ip   = ["10.2.0.0/24"]
      delegations = [
        {
          name         = "delegation-funcapp"
          service_name = "Microsoft.Web/serverFarms"
          actions      = ["Microsoft.Network/virtualNetworks/subnets/action"]
        }
      ]
      service_endpoints = [
        { service = "Microsoft.ServiceBus" }
      ]
    }
    data = {
      name = "snet-data"
      ip   = ["10.3.0.0/24"]
      service_endpoints = [
        { service = "Microsoft.Sql" },
        { service = "Microsoft.Storage" }
      ]
      private_endpoint_network_policies             = "Disabled"
      private_link_service_network_policies_enabled = "Disabled"
    }
    aks = {
      name = "snet-aks"
      ip   = ["10.4.0.0/22"]
      delegations = [
        {
          name         = "delegation-aks"
          service_name = "Microsoft.ContainerService/managedClusters"
          actions      = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
        }
      ]
    }
  }

  tags = {
    environment = "prod"
    managed_by  = "terraform"
    cost_center = "platform"
  }
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vnet"></a> [vnet](#module\_vnet) | github.com/Think-Cube/terraform-azure-virtual-network | v1.0.0 |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->
