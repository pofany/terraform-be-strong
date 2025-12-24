variable "resource_group_name" {
  type        = string
  description = "The name of the resource group for the backend storage account."
}

variable "storage_account_name" {
  type        = string
  description = "The name of the storage account for the backend."
}

variable "location" {
  type        = string
  description = "The Azure region where resources will be created."
  default     = "East US"
}

variable "prefix" {
  type        = string
  description = "Prefix for naming resources."
  default     = "BeStrong"
}

//Sensitive Variables
variable "sql_admin_username" {
  type        = string
  description = "The administrator username for the SQL Server."
  default     = "sqladminuser"
  sensitive   = true
}

variable "sql_admin_password" {
  type        = string
  description = "The administrator password for the SQL Server."
  sensitive   = true
}