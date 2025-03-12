# Create S3 Bucket for Terraform State
resource "aws_s3_bucket" "s3-bucket" {
  bucket = var.s3-bucket-name # Ensure unique name

  tags = { Name = "S3 Bucket Storage" }
}

provider "aws" {
  region = var.aws-region-name
}