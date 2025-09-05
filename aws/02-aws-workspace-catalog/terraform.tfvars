# AWS authentication and region
aws_profile = "your_aws_profile"
region = "us-east-1"

# AWS resources
cidr_block = "10.1.0.0/19"
environment = "dev"
tags = {
  // dont add Environment: dev, it gets added in init.tf
  // dont add Vendor: Databricks environment: dev, it gets added in init.tf
  Team = "my_awesome_company-de-team"
}

# Databrikcs authentication
databricks_account_id       = "1234-4567-8910"
databricks_client_id        = "1234-4567-8910"
databricks_client_secret    = "1234-4567-8910"

# UC metastore ID
metastore_id = "1234-4567-8910"