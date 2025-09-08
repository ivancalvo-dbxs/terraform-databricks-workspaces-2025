// --- 1. AWS INFRA

module "aws_base" {
  providers = {
    databricks.mws = databricks.mws
  }
  source                = "../modules/aws-workspace-base-infra"
  prefix                = "databricks-${local.prefix}"
  region                = var.region
  databricks_account_id = var.databricks_account_id
  cidr_block            = var.cidr_block
  tags                  = local.tags
  roles_to_assume       = [local.aws_access_services_role_arn]
}

// --- 2. WORKSPACE
module "databricks_workspace" {
  providers = {
    databricks = databricks.mws
  }
  source                 = "../modules/databricks-workspace"
  prefix                 = "${local.prefix}"
  region                 = var.region
  databricks_account_id  = var.databricks_account_id
  security_group_ids     = module.aws_base.security_group_ids
  vpc_private_subnets    = module.aws_base.subnets
  vpc_id                 = module.aws_base.vpc_id
  root_storage_bucket    = module.aws_base.root_bucket
  cross_account_role_arn = module.aws_base.cross_account_role_arn
  tags                   = local.tags
  
  depends_on = [
    module.aws_base
  ]
}

// --- 3. UNITY CATALOG: ADMIN GROUP AND METASTORE

data "databricks_service_principal" "admin_service_principal" {
  provider       = databricks.mws
  application_id = var.databricks_client_id
}

resource "databricks_group" "unity_admin_group" {
  provider     = databricks.mws
  display_name = local.unity_admin_group
}

resource "databricks_group_member" "my_service_principal" {
  provider  = databricks.mws
  group_id  = databricks_group.unity_admin_group.id
  member_id = data.databricks_service_principal.admin_service_principal.id
}

module "unity_catalog" {
  source = "../modules/databricks-uc-metastore"
  providers = {
    databricks = databricks.mws
  }
  metastore_name           = "metastore-${var.region}"
  region                   = var.region
  databricks_account_id    = var.databricks_account_id
  databricks_workspace_ids = [module.databricks_workspace.databricks_workspace_id]

  depends_on = [
    resource.databricks_group_member.my_service_principal
  ]
}

// --- 3. CREATES UC CATALOG AND ITS RESPECTIVE S3 BUCKET

module "databricks_catalog" {
  providers = {
    databricks = databricks.workspace
  }
  source                 = "../modules/databricks-catalog"
  prefix                 = local.prefix
  catalog_name           = var.environment
  aws_profile            = var.aws_profile
  region                 = var.region
  databricks_account_id  = var.databricks_account_id
  tags                   = local.tags
  
  depends_on = [
    resource.time_sleep.wait_for_groups
  ]
}