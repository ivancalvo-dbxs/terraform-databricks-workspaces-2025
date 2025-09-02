locals {
  prefix   = "databricks-${var.environment}"
  
  // NO SPECIAL CHARACTERS ON ADLS
  adls_name = replace(join("", [var.company_name, var.environment, "uc"]), "/[^a-zA-Z0-9]/", "") 

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