output "principal_id" {
  description = "The principal ID of the user assigned identity"
  value       = azurerm_user_assigned_identity.this.principal_id
}