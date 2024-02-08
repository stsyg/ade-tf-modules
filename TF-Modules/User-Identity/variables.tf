variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resources"
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