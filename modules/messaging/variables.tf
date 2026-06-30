variable "resource_group_name" {
    description = "Resource group name"  
    type = string
}

variable "location" {
    description = "Region"
    type = string  
}

variable "servicebus_namespace_name" {
    description = "Service Name Space"
    type = string  
}


variable "servicebus_queue_name" {
    description = "Service bus queue"
    type = string  
}

variable "tags" {
    description = "tags"
    type = map(string)
    default = {}  
}