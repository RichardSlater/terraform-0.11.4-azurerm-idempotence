variable "aad_tenant_id" {
  description = "Azure Active Directory Tenant ID"
  default     = "9826f1da-56b0-4a4e-a8b3-9e1fa7a17cf7"
}

variable "user_object_id" {
  description = "The object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault."
  default     = "192a13e7-fa31-4ee1-9e1a-f7c46c9a82b6"
}

variable "resource_group_name" {
  description = "The name of the resource group being created."
  default     = "amido-uks-cb170-rg-bot-dev"
}

variable "location" {
  description = "The location to deploy the resource."
  default     = "UK South"
}

variable "key_vault_name" {
  description = "The name of the keyvault being created."
  default     = "amido-uks-cb170-kv-dev"
}

variable "storage_acct_name" {
  description = "The name of the storage account being created."
  default     = "amidoukscb170"
}