resource "azurerm_key_vault" "kv" {
  name                        = "kv-${element(split("-", var.resource_group_name), 1)}-${element(split(".", cidrhost(var.first_existing_peerings, 0)), 2)}"
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = var.tenant_id
  sku_name                    = "standard"
  purge_protection_enabled    = false
  soft_delete_retention_days  = 7
  tags                        = var.tags

  lifecycle {
    ignore_changes = [name, location, resource_group_name, tenant_id, sku_name, purge_protection_enabled, soft_delete_retention_days, tags]
  }
}

resource "azurerm_key_vault_access_policy" "azurespn" {
  key_vault_id = azurerm_key_vault.kv.id

  tenant_id = var.tenant_id
  object_id = var.object_id

  key_permissions = [
    "Get",
    "List",
    "Delete",
    "Create",
    "Import",
    "Update",
    "Recover",
    "Backup",
    "Restore",
  ]

  secret_permissions = [
    "Get",
    "List",
    "Set",
    "Delete",
    "Backup",
    "Restore",
    "Recover",
    "Purge",
  ]

  lifecycle {
    ignore_changes = [key_permissions, secret_permissions]
  }
}

resource "azurerm_key_vault_access_policy" "app" {
  key_vault_id = azurerm_key_vault.kv.id

  tenant_id = var.tenant_id
  object_id = var.principal_id

  key_permissions = [
    "Get",
    "List",
    "Delete",
    "Create",
    "Import",
    "Update",
    "Recover",
    "Backup",
    "Restore",
  ]

  secret_permissions = [
    "Get",
    "List",
    "Set",
    "Delete",
    "Backup",
    "Restore",
    "Recover",
    "Purge",
  ]
}

resource "azurerm_key_vault_secret" "default_cidr_secret" {
  name         = "cidr"
  value        = var.first_existing_peerings
  key_vault_id = azurerm_key_vault.kv.id

  depends_on = [ 
    azurerm_key_vault_access_policy.app, 
    azurerm_key_vault_access_policy.azurespn 
  ]

  lifecycle {
    ignore_changes = [value]
  }
}