output "service_principal_application_id" {
    description = "The object id of service principal"
    value = azuread_service_principal.main.client_id 
}

output "client_id" {
  description = "The application id of AzureAD application created."
  value       = azuread_application.main.client_id
}

output "client_secret" {
  description = "Password for service principal."
  value       = azuread_service_principal_password.main.value
}