resource "azurerm_servicebus_namespace" "main" {
  name                = var.servicebus_namespace_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Standard"
  tags                = var.tags
}

resource "azurerm_servicebus_queue" "orders" {
  name                                    = var.servicebus_queue_name
  namespace_id                            = azurerm_servicebus_namespace.main.id
  default_message_ttl                     = "P14D"
  lock_duration                           = "PT5M"
  max_delivery_count                      = 10
  dead_lettering_on_message_expiration    = true
  requires_duplicate_detection            = true
  duplicate_detection_history_time_window = "PT10M"
}