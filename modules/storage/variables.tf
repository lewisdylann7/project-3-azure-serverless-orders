variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Region"
  type        = string
}

variable "storage_account_name" {
  description = "Storage account name"
  type        = string
}

variable "tags" {
  description = "tags"
  type        = map(string)
  default     = {}
}