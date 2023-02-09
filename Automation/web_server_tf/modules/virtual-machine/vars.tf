
variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "nic_id" {
  type = list(string)
}

variable "common_tags" {
  type    = map(string)
  default = {}
}

variable "computer_name" {
  type    = string
  default = "phani-webserver"
}

variable "admin_user" {
  type    = string
  default = "webserver-admin"
}

variable "admin_password" {
  type      = string
  sensitive = true
  default   = "AdminUser@123"
}

variable "instance_size" {
  type    = string
  default = "Standard_F2"
}

variable "instance_name" {
  type    = string
  default = "web_server"
}
