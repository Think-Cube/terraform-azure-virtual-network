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
