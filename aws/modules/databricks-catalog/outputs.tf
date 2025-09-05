output "catalog_name" {
  value       = resource.databricks_catalog.catalog.name
  description = "Databricks workspace URL"
}
