# Azure
subscription_id = "your_subscription_id"
rglocation = "eastus"

# Company info
environment = "dev"

# Network: this template creates two subnets with mask of: VPC mask + 3
# /19 - > 2x /22 subnets
cidr = "10.1.0.0/19"

tags = {
    // environment: ${var.environment} tag added already on main.tf
    // vendor: Databrickks tag added already on main.tf
    "team": "my_awesome_company-data_team"
}