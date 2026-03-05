locals {
  # Common tags to be applied to all resources for consistency and cost tracking.
  common_tags = {
    Owner     = "Terraform"
    Project   = var.project_name
    ManagedBy = "Terraform"
  }

  # Construct resource names using variables for uniqueness and consistency.
  s3_bucket_name      = "tf-state-${var.project_name}-${var.environment}"
  dynamodb_table_name = "tf-lock-${var.project_name}-${var.environment}"
}
