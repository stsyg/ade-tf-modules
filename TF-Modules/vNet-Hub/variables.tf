variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resources"
  type        = string
}

variable "vnet_address_space" {
  description = "The address space of the virtual network"
  type        = list(string)
}

variable "subnet_name_fw" {
  description = "The name of the Azure FW subnet"
  type        = string
}

variable "subnet_address_fw_prefixes" {
  description = "The address prefixes of the Azure FW subnet"
  type        = list(string)
}

variable "tags" {
  description = "Tags of the resources"
  type        = map(string)
  default     = {}
}