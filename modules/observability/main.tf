resource "azurerm_log_analytics_workspace" "main" {
    name = var.log_analytics_workspace_name
    resource_group_name = var.resource_group_name
    location = var.location
    sku = "PerGB2018"
    retention_in_days = 30
    daily_quota_gb = -1
    tags = var.tags  
}

resource "azurerm_application_insights" "main" {
    name = var.application_insights_name
    resource_group_name = var.resource_group_name
    location = var.location
    application_type = "web"
    workspace_id = azurerm_log_analytics_workspace.main.id  
    retention_in_days = 30
    daily_data_cap_in_gb = 1
    sampling_percentage = 100
    tags = var.tags
}