# AWS authentication and region
aws_profile = "your_aws_profile" // For AWS cli authentication
region = "us-east-1" // AWS region where you want to deploy your resources

# AWS resources
cidr_block = "10.1.0.0/19" // CIDR block for the workspace VPC, will be divided in two equal sized subnets
environment = "dev"
tags = {
  // dont add Environment: dev, it gets added in init.tf
  // dont add Vendor: Databricks environment: dev, it gets added in init.tf
  Team = "my_awesome_company-de-team"
}

# Databrikcs authentication
databricks_account_id       = "1234-4567-8910" // Databricks Account ID
databricks_client_id        = "1234-4567-8910" // Databricks Service Principal Client ID
databricks_client_secret    = "1234-4567-8910" // Databricks Service Principal Client Secret

# Databricks resources
unity_admin_group = "unity-admins" // Metastore Owner and Admin