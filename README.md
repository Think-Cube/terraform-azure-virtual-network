## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.4 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 4.46.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.46.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_subnet.main](https://registry.terraform.io/providers/hashicorp/azurerm/4.46.0/docs/resources/subnet) | resource |
| [azurerm_virtual_network.main](https://registry.terraform.io/providers/hashicorp/azurerm/4.46.0/docs/resources/virtual_network) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/4.46.0/docs/data-sources/client_config) | data source |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/4.46.0/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | A mapping of tags to assign to the resource. | `map(any)` | <pre>{<br/>  "ManagedByTerraform": "True"<br/>}</pre> | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Variable that defines the name of the environment. | `string` | `"dev"` | no |
| <a name="input_region"></a> [region](#input\_region) | Region in which resources are deployed. | `string` | `"weu"` | no |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | The location/region where the virtual network is created. Changing this forces a new resource to be created. | `string` | `"West Europe"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the virtual network. | `string` | n/a | yes |
| <a name="input_subnet_prefix"></a> [subnet\_prefix](#input\_subnet\_prefix) | List of subnets with their prefixes and optional service endpoints and delegations | <pre>map(object({<br/>    name              = string<br/>    ip                = list(string)<br/>    service_endpoints = optional(list(object({<br/>      service = string<br/>    })), [])<br/>    delegations = optional(list(object({<br/>      name         = string<br/>      service_name = string<br/>      actions      = list(string)<br/>    })), [])<br/>    private_endpoint_network_policies = optional(string, null)<br/>    private_link_service_network_policies_enabled = optional(string, null)<br/>  }))</pre> | <pre>{<br/>  "example-subnet-1": {<br/>    "delegations": [<br/>      {<br/>        "actions": [<br/>          "Microsoft.Network/virtualNetworks/subnets/action"<br/>        ],<br/>        "name": "delegation1",<br/>        "service_name": "Microsoft.Web/serverFarms"<br/>      }<br/>    ],<br/>    "ip": [<br/>      "10.0.1.0/24"<br/>    ],<br/>    "name": "subnet-1",<br/>    "private_endpoint_network_policies": "Disabled",<br/>    "private_link_service_network_policies_enabled": false,<br/>    "service_endpoints": [<br/>      {<br/>        "service": "Microsoft.Storage"<br/>      },<br/>      {<br/>        "service": "Microsoft.Sql"<br/>      }<br/>    ]<br/>  },<br/>  "example-subnet-2": {<br/>    "delegations": [<br/>      {<br/>        "actions": [<br/>          "Microsoft.Network/virtualNetworks/subnets/action"<br/>        ],<br/>        "name": "delegation2",<br/>        "service_name": "Microsoft.Web/serverFarms"<br/>      }<br/>    ],<br/>    "ip": [<br/>      "10.0.2.0/24"<br/>    ],<br/>    "name": "subnet-2",<br/>    "private_endpoint_network_policies": "Disabled",<br/>    "private_link_service_network_policies_enabled": false,<br/>    "service_endpoints": [<br/>      {<br/>        "service": "Microsoft.Storage"<br/>      }<br/>    ]<br/>  }<br/>}</pre> | no |
| <a name="input_vnet_address_space"></a> [vnet\_address\_space](#input\_vnet\_address\_space) | The address space that is used the virtual network. You can supply more than one address space. | `string` | `"10.0.0.0/16"` | no |
| <a name="input_vnet_custom_dns"></a> [vnet\_custom\_dns](#input\_vnet\_custom\_dns) | If applicable, a list of custom DNS servers to use inside your virtual network.  Unset will use default Azure-provided resolver | `list(string)` | `null` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | The name of the virtual network. Changing this forces a new resource to be created. | `string` | `"VirtualNetwork1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_address_space"></a> [address\_space](#output\_address\_space) | The list of address spaces used by the virtual network. |
| <a name="output_id"></a> [id](#output\_id) | The virtual NetworkConfiguration ID. |
| <a name="output_location"></a> [location](#output\_location) | The location/region where the virtual network is created. |
| <a name="output_name"></a> [name](#output\_name) | The name of the virtual network. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | The name of the resource group in which to create the virtual network. |
