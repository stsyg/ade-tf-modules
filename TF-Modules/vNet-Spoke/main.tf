resource "azurerm_virtual_network" "spoke_vnet" {
  name                = "spoke-${element(split("-", var.spoke_resource_group_name), 1)}-${element(split(".", cidrhost(var.selected_cidr_block, 0)), 2)}"
  location            = var.spoke_location
  resource_group_name = var.spoke_resource_group_name
  address_space       = [var.selected_cidr_block]
  tags                = var.tags

  lifecycle {
    ignore_changes = [address_space, name]
  }
}

resource "azurerm_virtual_network_peering" "hub_to_spoke" {
  name                         = "${var.hub_vnet_name}-to-${azurerm_virtual_network.spoke_vnet.name}"
  resource_group_name          = var.hub_vnet_resource_group_name
  virtual_network_name         = var.hub_vnet_name
  remote_virtual_network_id    = azurerm_virtual_network.spoke_vnet.id
  allow_virtual_network_access = true

  lifecycle {
    ignore_changes = [remote_virtual_network_id]
  }
}

resource "azurerm_virtual_network_peering" "spoke_to_hub" {
  name                         = "${azurerm_virtual_network.spoke_vnet.name}-to-${var.hub_vnet_name}"
  resource_group_name          = var.spoke_resource_group_name
  virtual_network_name         = azurerm_virtual_network.spoke_vnet.name
  remote_virtual_network_id    = var.hub_vnet_id
  allow_virtual_network_access = true

  lifecycle {
    ignore_changes = [remote_virtual_network_id]
  }
}