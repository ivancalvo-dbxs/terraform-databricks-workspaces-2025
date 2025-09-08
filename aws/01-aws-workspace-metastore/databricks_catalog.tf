resource "databricks_catalog" "catalog" {
  provider     = databricks.workspace
  metastore_id = module.unity_catalog.metastore_id
  name         = var.environment
  comment      = "${var.environment} catalog created from Terraform"
  properties = {
    purpose = "${var.environment} catalog created from TF"
  }
  owner = databricks_group.unity_admin_group.display_name

  depends_on = [
    databricks_group_member.my_service_principal,
    databricks_mws_permission_assignment.add_unity_admin_group
  ]
  force_destroy = true
}
