provider "aws" {
  region = var.aws_region
}

provider "aws" {
  alias  = "s3"
  region = var.s3_region
}
