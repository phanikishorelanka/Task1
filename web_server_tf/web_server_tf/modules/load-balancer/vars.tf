
variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "public_ip_id" {
  type = string
}

variable "vnet_id" {
  type = string
}

variable "webserver_private_ip" {
  type = string
}

variable "load_balancer_sku" {
  type    = string
  default = "Standard"
}

variable "tcp_protocal" {
  type    = string
  default = "Tcp"
}

variable "app_prefix" {
  type    = string
  default = "webserver"
}

variable "load_balancer_name" {
  type    = string
  default = "webserver_lb"
}


