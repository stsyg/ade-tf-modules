output "default_cidr_secret_name" {
  description = "The name of the default CIDR secret"
  value       = azurerm_key_vault_secret.default_cidr_secret.name
}

output "key_vault_id" {
  description = "The ID of the key vault"
  value       = azurerm_key_vault.kv.id
}