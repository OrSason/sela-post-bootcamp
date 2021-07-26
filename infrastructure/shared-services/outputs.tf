output "admin_password" {
  value       = azurerm_container_registry.acr.admin_password
  description = "The object ID of the user"
}

output "admin_username" {
  value       = azurerm_container_registry.acr.admin_username
  description = "The object ID of the user"
}