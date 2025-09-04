locals {
  prefix   = "databricks-${var.environment}-${random_string.naming.result}"
  
  // NO SPECIAL CHARACTERS ON ADLS
  adls_name = replace(join("", ["databricks", var.environment, random_string.naming.result, "uc"]), "/[^a-zA-Z0-9]/", "") 

  // tags that are propagated down to all resources
  tags = merge({
    Environment = var.environment
    Vendor       = "Databricks"
  }, var.tags)
}

resource "azurerm_resource_group" "this" {
  name     = "${local.prefix}-rg"
  location = var.rglocation
  tags     = local.tags
}

resource "random_string" "naming" {
  special = false
  upper   = false
  lower = false
  numeric = true
  length  = 6
}