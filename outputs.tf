output "resource_group_name" {
  description = "Resource group name"
  value       = var.resource_group_name
}

output "function_app_name" {
  description = "Function app name"
  value       = module.functionapp.function_app_name
}

output "function_app_url" {
  description = "url"
  value       = module.functionapp_function_app_url
}

output "servicebus_namespace_name" {
  description = "Service bus namespace"
  value       = module.messaging.servicebus_namespace_name
}

output "servicebus_queue_name" {
  description = "Service bus q name"
  value       = module.messaging.servicebus_queue_name
}

output "key_vault_uri" {
  description = "Key vault Uri"
  value       = module.key_vault.key_vault_uri
}