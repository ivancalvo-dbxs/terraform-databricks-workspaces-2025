variable "subscription_id" {
  type        = string
  description = "Azure Subscription ID to deploy the workspace into"
}

variable "rglocation" {
  type        = string
  default     = "eastus"
  description = "Location of resource group to create"
}

variable "company_name" {
  type        = string
  default     = "greenapple"
  description = "Company name prefix for the Azure resources"
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "Usually dev-qa-prod"
}

variable "cidr" {
  type        = string
  default     = "10.1.0.0/20"
  description = "Network range for created VNet"
}

variable "tags" {
  type        = map(string)
  description = "Optional tags to add to resources"
  default     = {}
}