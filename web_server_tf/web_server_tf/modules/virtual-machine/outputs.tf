
output "instance_id" {
  value = azurerm_linux_virtual_machine.main.id
}

output "instance_name" {
  value = azurerm_linux_virtual_machine.main.name
}

output "private_ip" {
  value = azurerm_linux_virtual_machine.main.private_ip_address
}
