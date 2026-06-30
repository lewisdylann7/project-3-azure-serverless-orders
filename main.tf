data "azurerm_client_config" "current" {}

module "observability" {
    source = "./modules/observability"
    resource_group_name = var.resource_group_name
    location = var.location
    log_analytics_workspace_name = var.log_analytics_workspace_name
    application_insights_name = var.application_insights_name    
    tags = local.common_tags
}
module "storage" {
    source = "./modules/storage"  
    resource_group_name = var.resource_group_name
    location = var.location
    storage_account_name = var.storage_account_name
    tags = local.common_tags
}

module "messaging" {
    module = "./modules/messaging"
    resource_group_name = var.resource_group_name
    location = var.location
    servicebus_namespace_name = var.servicebus_namespace_name
    servicebus_queue_name = var.servicebus_queue_name
    tags = local.common_tags
}

module "keyvault" {
    module = "./modules/keyvault"
    resource_group_name = var.resource_group_name
    location = var.location  
    key_vault_name = var.key_vault_name
    tenant_id = data.azurerm_client_config.current.tenant_id
    deployer_object_id = data.azurerm_client_config.object_id
    tags = local.common_tags
}

module "functionapp" {
    module ="./modules/functionapp"
    resource_group_name = var.resource_group_name
    location = var.location
    function_plan_name = var.function_plan_name
    function_app_name = var.function_app_name
    storage_account_name = module.storage.storage_account_name
    storage_account_access_key = module.storage.storage_account_primary_access_key
    application_insights_connection_string = module.observability.application_insights_connection_string
    servicebus_namespace_name = var.servicebus_namespace_name
    key_vault_uri = module.keyvault.key_vault_uri
    tags = local.common_tags
    depends_on = [ module.storage, module.messaging, module.keyvault ]
}

resource "azurerm_key_vault_access_policy" "functionapp_access" {
    keykey_vault_id = module.keyvault.key_vault_id
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = module.functionapp.function_app_principal_id
    secret_permissions = [
        "Get",
        "List",
        "Set"
    ]  
}

resource "azurerm_role_assignment" "function_servicebus_receiver" {
    scope = module.messaging.servicebus_namespace_name
    role_definition_name = "Azure Service Bus Data Receiver"
    principal_id = module.functionapp.function_app_principal_id
}

resource "azurerm_role_assignment" "function_servicebus_sender" {
    scope = module.messaging.servicebus_namespace_id
    role_definition_name = "Azure Service Bus Data Sender"
    principal_id = module.functionapp.function_app_principal_id
}