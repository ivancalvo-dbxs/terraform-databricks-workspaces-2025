resource "databricks_catalog" "catalog" {
  provider     = databricks.workspace
  metastore_id = module.unity_catalog.metastore_id
  name         = var.environment
  comment      = "This catalog is managed by terraform"
  properties = {
    purpose = "Catalog created from TF for ${var.environment} environment"
  }

  depends_on = [
    databricks_group_member.my_service_principal,
    resource.databricks_mws_permission_assignment.add_admin_group,
    databricks_group.users
  ]
  force_destroy = true
}

resource "databricks_grants" "unity_catalog_grants" {
  provider = databricks.workspace
  catalog  = databricks_catalog.catalog.name
  grant {
    principal  = local.workspace_users_group
    privileges = ["USE_CATALOG", "USE_SCHEMA", "CREATE_SCHEMA", "CREATE_TABLE"]
  }

  depends_on = [
    resource.databricks_mws_permission_assignment.add_admin_group
  ]
}
