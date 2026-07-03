variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "region"
  type        = string
}

variable "key_vault_name" {
  description = "Key vault Name"
  type        = string
}

variable "tenant_id" {
  description = "Tenant id"
  type        = string
}

variable "deployer_object_id" {
  description = "Who created vault"
  type        = string
}

variable "tags" {
  description = "tags"
  type        = map(string)
  default     = {}
}