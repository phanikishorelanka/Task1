
variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vnet_name" {
  type    = string
  default = "default_vnet"
}

variable "vnet_address_space" {
  type    = list(string)
  default = ["10.1.0.0/16"]
}

variable "common_tags" {
  type    = map(string)
  default = {}
}

