# Example: Basic — Azure Virtual Network

Provisions an Azure Virtual Network with subnets, DNS settings and optional DDoS protection. Minimal example using required inputs only.

## Usage

```hcl
module "vnet" {
  source = "../.."

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