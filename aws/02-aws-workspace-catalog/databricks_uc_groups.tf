data "databricks_service_principal" "admin_service_principal" {
  provider       = databricks.mws
  application_id = var.databricks_client_id
}

// Create User and Admin Groups

resource "databricks_group" "workspace_admin_group" {
  provider     = databricks.mws
  display_name = "${local.prefix}-admins"
}

resource "databricks_group" "workspace_users_group" {
  provider     = databricks.mws
  display_name = "${local.prefix}-users"
}

resource "databricks_mws_permission_assignment" "add_admin_group" {
  provider     = databricks.mws
  workspace_id = module.databricks_workspace.databricks_workspace_id
  principal_id = resource.databricks_group.workspace_admin_group.id
  permissions  = ["ADMIN"]
}

resource "databricks_mws_permission_assignment" "add_users_group" {
  provider     = databricks.mws
  workspace_id = module.databricks_workspace.databricks_workspace_id
  principal_id = resource.databricks_group.workspace_admin_group.id
  permissions  = ["USERS"]
}