# Create an S3 Bucket for Databricks Storage
resource "aws_s3_bucket" "databricks_external_storage" {
  bucket = "databricks-${var.prefix}-catalog"  # Make the name unique
  force_destroy = true
  tags = {
    Name        = "${var.prefix}-catalog"
  }
}

# Enable S3 Versioning (Optional, Recommended for Data Protection)
resource "aws_s3_bucket_versioning" "databricks_root_versioning" {
  bucket = aws_s3_bucket.databricks_external_storage.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Block Public Access to the S3 Bucket
resource "aws_s3_bucket_public_access_block" "databricks_root" {
  bucket = aws_s3_bucket.databricks_external_storage.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

