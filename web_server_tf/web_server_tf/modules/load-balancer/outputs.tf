
output "load_balancer_ip_config" {
    value = azurerm_lb.main.frontend_ip_configuration
}