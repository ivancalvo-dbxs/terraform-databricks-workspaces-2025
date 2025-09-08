resource "databricks_metastore" "this" {
  name          = var.metastore_name
  region        = var.region
  force_destroy = true
}

resource "databricks_metastore_assignment" "default_metastore" {
  count                = length(var.databricks_workspace_ids)
  workspace_id         = var.databricks_workspace_ids[count.index]
  metastore_id         = databricks_metastore.this.id
}