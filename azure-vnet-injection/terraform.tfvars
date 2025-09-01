subscription_id = "your_subscription_id"
rglocation = "eastus"
company_name = "my_awesome_company"
environment = "dev"
cidr = "10.1.0.0/19"
tags = {
    // environment: ${var.environment} tag added already on main.tf
    // vendor: Databrickks tag added already on main.tf
    "team": "my_awesome_company-data_team"
}