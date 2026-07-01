resource "azurerm_key_vault" "main" {
    name = var.key_vault_name
    location = var.location
    resource_group_name = var.resource_group_name
    tenant_id = var.tenant_id
    sku_name = "standard"
    soft_delete_retention_days = 7
    purge_protection_enabled = false  
    public_network_access_enabled = true
    enable_rbac_authorization = false
    network_acls {
        default_action = "Allow"
        bypass = "AzureServices"
        }
    tags = var.tags    
}

resource "azurerm_key_vault_access_policy" "deployer" {
    key_vault_id = azurerm_key_vault.main.id
    tenant_id = var.tenant_id
    object_id = var.deployer_object_id
    secret_permissions = [
        "Get",
        "List",
        "Set",
        "Recover"
    ]  
}
resource "azurerm_key_vault_secret" "sample_secret" {
    name = "OrderProcessingMode"
    value = "standard"
    key_vault_id = azurerm_key_vault.main.id
    depends_on = [azurerm_key_vault_access_policy.deployer]  
}