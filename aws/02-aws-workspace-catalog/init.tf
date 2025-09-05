data "aws_caller_identity" "current" {}

locals {
  prefix                        = "${var.environment}-${random_string.naming.result}"
  workspace_users_group         = "${var.environment}-users"
  aws_access_services_role_name = var.aws_access_services_role_name == null ? "${local.prefix}-aws-services-role" : "${local.prefix}-${var.aws_access_services_role_name}"
  aws_access_services_role_arn  = "arn:aws:iam::${local.aws_account_id}:role/${local.aws_access_services_role_name}"
  aws_account_id                = data.aws_caller_identity.current.account_id
  tags = merge({
    Environment = var.environment
    Vendor       = "Databricks"
  }, var.tags)
}

resource "random_string" "naming" {
  special = false
  upper   = false
  lower = false
  numeric = true
  length  = 6
}