resource "azurerm_service_plan" "main" {
  name                = var.function_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = "Y1"

  tags = var.tags
}

resource "azurerm_linux_function_app" "main" {
  name                        = var.function_app_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  service_plan_id             = azurerm_service_plan.main.id
  storage_account_name        = var.storage_account_name
  storage_account_access_key  = var.storage_account_access_key
  functions_extension_version = "~4"
  https_only                  = true

  site_config {
    application_stack {
      node_version = "20"
    }
  }

  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME"                      = "node"
    "APPLICATIONINSIGHTS_CONNECTION_STRING"         = var.application_insights_connection_string
    "ServiceBusConnection__fullyQualifiedNamespace" = "${var.servicebus_namespace_name}.servicebus.windows.net"
    "KEY_VAULT_URI"                                 = var.key_vault_uri
  }

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}
