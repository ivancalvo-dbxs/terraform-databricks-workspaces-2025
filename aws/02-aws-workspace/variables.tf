
# Step 1: Initializing configs and variables 
variable "tags" {
  type        = map(string)
  description = "(Optional) List of tags to be propagated accross all assets in this demo"
}

variable "environment" {
  type        = string
  description = "(Required) Databricks workspace name to be used for deployment"
}

variable "cidr_block" {
  type        = string
  description = "(Required) CIDR block to be used to create the Databricks VPC"
}

variable "region" {
  type        = string
  description = "(Required) AWS region where the assets will be deployed"
}

variable "aws_profile" {
  type        = string
  description = "(Required) AWS cli profile to be used for authentication with AWS"
}

variable "databricks_client_id" {
  type        = string
  description = "(Required) Client ID to authenticate the Databricks provider at the account level"
}

variable "databricks_client_secret" {
  type        = string
  description = "(Required) Client secret to authenticate the Databricks provider at the account level"
}

variable "databricks_account_id" {
  type        = string
  description = "(Required) Databricks Account ID"
}

variable "aws_access_services_role_name" {
  type        = string
  description = "(Optional) Name for the AWS Services role by this module"
  default     = null
}

