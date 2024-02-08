variable "spoke_resource_group_name" {
  description = "The name of the spoke resource group"
  type        = string
}

variable "spoke_location" {
  description = "The location of the spoke resources"
  type        = string
}

variable "selected_cidr_block" {
  description = "The selected CIDR block for the spoke virtual network"
  type        = string
}

variable "tags" {
  description = "Tags of the resources"
  type        = map(string)
  default     = {}
}

variable "hub_vnet_name" {
  description = "The name of the hub virtual network"
  type        = string
}

variable "hub_vnet_resource_group_name" {
  description = "The name of the resource group of the hub virtual network"
  type        = string
}

variable "hub_vnet_id" {
  description = "The ID of the hub virtual network"
  type        = string
}