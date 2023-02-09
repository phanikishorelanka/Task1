
variable "resource_group_name" {
  type    = string
  default = "phani-test-rg"
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "environment" {
  type    = string
  default = "dev"

  validation {
    condition     = contains(["dev", "qa", "preprod", "prod"], var.environment)
    error_message = "Valid values for environment are (dev, qa, preprod, prod)."
  }
}

locals {
  common_tags = {
    environment = var.environment
  }
}
