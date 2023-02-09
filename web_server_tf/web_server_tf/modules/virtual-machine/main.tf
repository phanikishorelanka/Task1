
resource "azurerm_linux_virtual_machine" "main" {
  size                  = var.instance_size
  name                  = var.instance_name
  resource_group_name   = var.resource_group_name
  location              = var.location
  custom_data           = base64encode(file("${path.module}/../../scripts/server-init.sh"))
  network_interface_ids = var.nic_id

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  computer_name                   = var.computer_name
  admin_username                  = var.admin_user
  admin_password                  = var.admin_password
  disable_password_authentication = false

  os_disk {
    name                 = "webserver-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = 30
  }

  tags = var.common_tags
}
