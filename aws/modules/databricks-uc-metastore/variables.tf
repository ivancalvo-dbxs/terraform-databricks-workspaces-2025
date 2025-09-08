variable "databricks_account_id" {
  type        = string
  description = "(Required) Databricks Account ID"
}

variable "metastore_name" {
  description = "(Optional) Name of the metastore that will be created"
  type        = string
  default     = null
}

variable "region" {
  type        = string
  description = "(Required) AWS region where the assets will be deployed"
}

variable "databricks_workspace_ids" {
  description = <<EOT
  List of Databricks workspace IDs to be enabled with Unity Catalog.
  Enter with square brackets and double quotes
  e.g. ["111111111", "222222222"]
  EOT
  type        = list(string)
  default     = []
}