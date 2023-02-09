
variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "public_ip_sku" {
  type = string
  default = "Standard"
}

variable "name" {
  type    = string
  default = "web_server_ip"
}
