
resource "azurerm_public_ip" "main" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.public_ip_sku
  allocation_method   = "Static"
}
