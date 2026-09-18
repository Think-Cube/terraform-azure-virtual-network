# Example: Basic — Azure Virtual Network

Provisions a VNet with a single subnet.

```hcl
module "vnet" {
  source = "github.com/Think-Cube/terraform-azure-virtual-network?ref=v1.0.0"

  name                = "vnet-myapp-prod"
  resource_group_name = "rg-example"
  location            = "West Europe"

  address_space = ["10.0.0.0/16"]

  subnet_prefix = {
    app = {
      name = "snet-app"
      ip   = ["10.0.1.0/24"]
    }
  }

  tags = {
    environment = "dev"
    managed_by  = "terraform"
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
