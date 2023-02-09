
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location

  tags = merge(
    var.common_tags,
    {
      location  = var.location
      owner     = "Phani"
      Terraform = true
  })
}
