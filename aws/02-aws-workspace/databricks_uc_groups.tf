// --- 4. GROUPS: WORKSPACE USERS AND ADMIS
resource "time_sleep" "wait_for_permission_apis" {
  depends_on = [
    resource.databricks_metastore_assignment.this
  ]
  create_duration = "20s"
}

resource "databricks_group" "workspace_admin_group" {
  provider     = databricks.mws
  display_name = "${local.prefix}-admins"
  depends_on = [ resource.time_sleep.wait_for_permission_apis ]
}

resource "databricks_group" "workspace_users_group" {
  provider     = databricks.mws
  display_name = "${local.prefix}-users"
  depends_on = [ resource.databricks_group.workspace_admin_group ]
}

resource "databricks_mws_permission_assignment" "add_ws_admins" {
  provider     = databricks.mws
  workspace_id = module.databricks_workspace.databricks_workspace_id
  principal_id = resource.databricks_group.workspace_admin_group.id
  permissions  = ["ADMIN"]
  depends_on = [
    resource.databricks_group.workspace_users_group
  ]
}

resource "databricks_mws_permission_assignment" "add_ws_users" {
  provider     = databricks.mws
  workspace_id = module.databricks_workspace.databricks_workspace_id
  principal_id = resource.databricks_group.workspace_users_group.id
  permissions  = ["USER"]
  depends_on = [
    resource.databricks_mws_permission_assignment.add_ws_admins
  ]
}

resource "time_sleep" "wait_for_groups" {
  depends_on = [
    resource.databricks_mws_permission_assignment.add_ws_users
  ]
  create_duration = "10s"
}