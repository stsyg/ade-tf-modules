resource "azurerm_user_assigned_identity" "this" {
  resource_group_name = var.resource_group_name
  location            = var.location
  name                = "uai-${element(split("-", var.resource_group_name), 1)}-${element(split(".", cidrhost(var.first_existing_peerings, 0)), 2)}"

  tags = var.tags

  lifecycle {
    ignore_changes = [name, location, resource_group_name, tags]
  }
}