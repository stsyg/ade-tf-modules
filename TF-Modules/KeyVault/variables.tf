variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resources"
  type        = string
}

variable "tenant_id" {
  description = "The tenant ID"
  type        = string
}

variable "object_id" {
  description = "The object ID"
  type        = string
}

variable "principal_id" {
  description = "The principal ID"
  type        = string
}

variable "first_existing_peerings" {
  description = "The first existing peerings"
  type        = string
}

variable "tags" {
  description = "Tags of the resources"
  type        = map(string)
  default     = {}
}