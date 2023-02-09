variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "nsg_name" {
  type    = string
  default = "default_nsg"
}
