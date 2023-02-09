
module "resource_group" {
  source = "./modules/resource-group"

  resource_group_name = var.resource_group_name
  location            = var.location
  common_tags         = local.common_tags
}

module "security_group" {
  source     = "./modules/network/security/group"
  depends_on = [module.resource_group]

  resource_group_name = var.resource_group_name
  location            = var.location
}

module "security_rule" {
  source     = "./modules/network/security/rule"
  depends_on = [module.security_group]

  resource_group_name         = var.resource_group_name
  network_security_group_name = module.security_group.name

  security_rules = [
    {
      "name" : "http"
      "description" : "allow http access to port 80"
      "priority" : 100
      "direction" : "Inbound"
      "access" : "Allow"
      "protocol" : "Tcp"
      "source_port_range" : "*"
      "destination_port_range" : "80"
      "source_address_prefix" : "*"
      "destination_address_prefix" : "*"
    },
    {
      "name" : "http8080"
      "description" : "allow http access to port 8080"
      "priority" : 110
      "direction" : "Inbound"
      "access" : "Allow"
      "protocol" : "Tcp"
      "source_port_range" : "*"
      "destination_port_range" : "8080"
      "source_address_prefix" : "*"
      "destination_address_prefix" : "*"
    }
  ]
}

module "virtual_network" {
  source     = "./modules/network/vnet"
  depends_on = [module.resource_group]

  resource_group_name = var.resource_group_name
  location            = var.location
  common_tags         = local.common_tags
}

module "subnet" {
  source     = "./modules/network/subnet"
  depends_on = [module.virtual_network]

  resource_group_name = var.resource_group_name
  vnet_name           = module.virtual_network.name
}

module "nic" {
  source     = "./modules/network/interface"
  depends_on = [module.resource_group]

  resource_group_name = var.resource_group_name
  location            = var.location
  subnet_id           = module.subnet.id
}

module "nic_association" {
  source     = "./modules/network/association"
  depends_on = [module.nic, module.security_group]

  nic_id = module.nic.id
  nsg_id = module.security_group.id
}

module "public_ip" {
  source     = "./modules/public-ip"
  depends_on = [module.resource_group]

  resource_group_name = var.resource_group_name
  location            = var.location
}

module "web_server_instance" {
  source     = "./modules/virtual-machine"
  depends_on = [module.resource_group]

  resource_group_name = var.resource_group_name
  location            = var.location
  nic_id              = [module.nic.id]
  common_tags         = local.common_tags
}

module "load_balancer" {
  source     = "./modules/load-balancer"
  depends_on = [module.resource_group, module.web_server_instance]

  resource_group_name  = var.resource_group_name
  location             = var.location
  public_ip_id         = module.public_ip.id
  webserver_private_ip = module.web_server_instance.private_ip
  vnet_id              = module.virtual_network.id
}
