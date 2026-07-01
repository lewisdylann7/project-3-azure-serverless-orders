output "function_app_name" {
  value = azurerm_linux_function_app.main.name
}

output "function_app_id" {
  value = azurerm_linux_function_app.main.id
}

output "function_app_principal_id" {
  value = azurerm_linux_function_app.main.identity[0].principal_id
}

output "function_app_url" {
  value = "[${azurerm_linux_function_app.main.default_hostname}](https://${azurerm_linux_function_app.main.default_hostname})"
}
