resource "databricks_catalog" "catalog" {
  provider     = databricks.workspace
  metastore_id = module.unity_catalog.metastore_id
  name         = var.environment
  comment      = "This catalog is managed by terraform"
  properties = {
    purpose = "${var.environment} catalog created from TF"
  }

  depends_on = [
    databricks_group_member.my_service_principal,
    resource.databricks_mws_permission_assignment.add_admin_group
  ]
  force_destroy = true
}
