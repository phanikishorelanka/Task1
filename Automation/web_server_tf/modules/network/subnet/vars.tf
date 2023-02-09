
variable "resource_group_name" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "subnet_name" {
  type    = string
  default = "default_subnet"
}

variable "subnet_address_prefixes" {
  type    = list(string)
  default = ["10.1.1.0/24"]
}
