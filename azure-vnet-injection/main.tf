locals {
  prefix   = "databricks-${var.company_name}-${var.environment}"
  adls_name = join("", [var.company_name, var.environment, "uc"]) //NO SPECIAL CHARACTERS

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