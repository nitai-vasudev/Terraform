resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name"  # Replace with a unique bucket name
  acl    = "private"

  tags = {
    Name        = "MyS3Bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.my_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name           = "terraform-state-locking" # Replace with your desired table name
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name = "Terraform State Lock Table"
  }
}

output "s3_bucket_id" {
  value       = aws_s3_bucket.my_bucket.id
  description = "The ID of the S3 bucket"
}

output "s3_bucket_arn" {
  value       = aws_s3_bucket.my_bucket.arn
  description = "The ARN of the S3 bucket"
}

# backend "s3" {
#   bucket         = "my-unique-bucket-name"  # Replace with your bucket name
#   key            = "terraform/state"         # Path to your Terraform state file
#   region         = "us-east-1"               # Replace with your bucket's region
#   dynamodb_table = "terraform-state-locking" # Replace with your DynamoDB table name
#   encrypt        = true                      # Enable server-side encryption
# }

# To use this, uncomment the `backend` configuration and replace the placeholder values
# Also, ensure the bucket and DynamoDB table are created before running `terraform init`
# You may need to create the S3 bucket and DynamoDB table manually the first time
# or use a separate Terraform configuration to create them
