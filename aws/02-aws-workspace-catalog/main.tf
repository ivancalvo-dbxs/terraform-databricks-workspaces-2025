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

data "databricks_metastore" "this" {
  provider = databricks.mws
  region = var.region
}

resource "databricks_metastore_assignment" "this" {
  provider = databricks.mws
  metastore_id = data.databricks_metastore.this.id
  workspace_id = module.databricks_workspace.databricks_workspace_id
  depends_on = [ module.databricks_workspace ]
}

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
    # module.databricks_workspace
    resource.time_sleep.wait_for_permission_apis
  ]
}

resource "databricks_workspace_binding" "catalog_binding" {
  securable_name = module.databricks_catalog.catalog_name
  workspace_id   = module.databricks_workspace.databricks_workspace_id

  depends_on = [
    module.databricks_catalog.catalog
  ]
}