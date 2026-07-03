variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Env"
  type        = string
}

variable "owner" {
  description = "Owner"
  type        = string
}

variable "location" {
  description = "Region"
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "storage_account_name" {
  description = "Storage account"
  type        = string
}

variable "servicebus_namespace_name" {
  description = "Service bus namespace"
  type        = string
}

variable "servicebus_queue_name" {
  description = "Service queue name"
  type        = string
}

variable "function_plan_name" {
  description = "Function plan name"
  type        = string
}

variable "function_app_name" {
  description = "Function app name"
  type        = string
}

variable "key_vault_name" {
  description = "Key vault name"
  type        = string
}

variable "application_insights_name" {
  description = "Application insights name"
  type        = string
}

variable "log_analytics_workspace_name" {
  description = "Log analytics workspace name"
  type        = string
}