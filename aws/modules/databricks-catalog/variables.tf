variable "aws_profile" {
  type    = string
}

variable "region" {
  type    = string
}

variable "prefix" {
  type    = string
}

variable "tags" {

}

variable "databricks_account_id" {
  type    = string
}

data "aws_caller_identity" "current" {}