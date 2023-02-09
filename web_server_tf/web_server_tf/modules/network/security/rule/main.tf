
resource "azurerm_network_security_rule" "main" {
  count = length(var.security_rules)

  resource_group_name         = var.resource_group_name
  network_security_group_name = var.network_security_group_name

  name                        = lookup(var.security_rules[count.index], "name")
  description                 = lookup(var.security_rules[count.index], "description")
  priority                    = lookup(var.security_rules[count.index], "priority")
  direction                   = lookup(var.security_rules[count.index], "direction")
  access                      = lookup(var.security_rules[count.index], "access")
  protocol                    = lookup(var.security_rules[count.index], "protocol")
  source_port_range           = lookup(var.security_rules[count.index], "source_port_range")
  destination_port_range      = lookup(var.security_rules[count.index], "destination_port_range")
  source_address_prefix       = lookup(var.security_rules[count.index], "source_address_prefix")
  destination_address_prefix  = lookup(var.security_rules[count.index], "destination_address_prefix")
}
