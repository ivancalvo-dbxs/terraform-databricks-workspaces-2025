terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=4.57.0"
    }

    databricks = {
      source  = "databricks/databricks"
      version = ">=1.24.1"
    }

    random = {
      source  = "hashicorp/random"
      version = "=3.4.1"
    }

  }
}