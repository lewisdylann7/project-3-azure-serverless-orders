variable "resource_group_name" {
    type = string  
}

variable "location" {
    type = string  
}

variable "function_plan_name" {
    type = string  
}

variable "function_app_name" {
    type = string  
}

variable "storage_account_name" {
    type = string  
}

variable "storage_account_access_key" {
    type = string
    sensitive = true  
}
variable "application_insights_connection_string" {
    type = string  
}

variable "servicebus_namespace_name" {
    type = string  
}

variable "key_vault_uri" {
    type = string  
}

variable "tags" {
    type = map(string)
    default = {}  
}