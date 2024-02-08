variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resources"
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "bastion_prefix_subnet" {
  type        = string
  description = "Azure Bastion Subnet prefix"
}

variable "bastion_pip_name" {
  type        = string
  description = "Azure Bastion Public IP name"
}

variable "bastion_host_name" {
  type        = string
  description = "Azure Bastion Host name"
}

variable "bastion_ip_configuration_name" {
  type        = string
  description = "Azure Bastion IP configuration name"
}

variable "tags" {
  description = "Tags of the resources"
  type        = map(string)
  default     = {}
}