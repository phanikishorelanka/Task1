
variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "nic_name" {
  type    = string
  default = "nic-00"
}
