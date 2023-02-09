
variable "resource_group_name" {
  type    = string
}

variable "network_security_group_name" {
  type    = string
}

variable "security_rules" {
  type = list(map(string))
}

