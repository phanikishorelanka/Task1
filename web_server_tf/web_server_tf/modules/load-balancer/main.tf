
resource "azurerm_lb" "main" {
  name                = var.load_balancer_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.load_balancer_sku

  frontend_ip_configuration {
    name                 = "${var.app_prefix}-public_ip_address"
    public_ip_address_id = var.public_ip_id
  }

  tags = {
    role = "load_balancer"
  }
}

resource "azurerm_lb_backend_address_pool" "main" {
  depends_on = [azurerm_lb.main]

  name            = "${var.app_prefix}-be_pool"
  loadbalancer_id = azurerm_lb.main.id
}

resource "azurerm_lb_backend_address_pool_address" "be_pool_address" {
  depends_on = [azurerm_lb_backend_address_pool.main]

  name                    = "${var.app_prefix}-be_pool_address"
  backend_address_pool_id = azurerm_lb_backend_address_pool.main.id
  virtual_network_id      = var.vnet_id
  ip_address              = var.webserver_private_ip
}

resource "azurerm_lb_nat_rule" "main" {
  name                           = "${var.app_prefix}-forward_rule"
  resource_group_name            = var.resource_group_name
  loadbalancer_id                = azurerm_lb.main.id
  protocol                       = var.tcp_protocal
  frontend_port_start            = 80
  frontend_port_end              = 80
  backend_port                   = 8080
  frontend_ip_configuration_name = "${var.app_prefix}-public_ip_address"
  backend_address_pool_id        = azurerm_lb_backend_address_pool.main.id
}
