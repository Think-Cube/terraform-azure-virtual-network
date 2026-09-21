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
