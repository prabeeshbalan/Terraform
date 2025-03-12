terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  #backend "local" {
  # path = "state/terraform.tfstate"
  #}
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

# Create S3 Bucket for Terraform State
resource "aws_s3_bucket" "s3-terraform-state-backup-name" {
  bucket = var.s3-terraform-state-backup-name_id # Ensure unique name

  tags = { Name = "Terraform State Backup Storage" }
}

# Enable Server-Side Encryption (SSE) on S3 Bucket
resource "aws_s3_bucket_server_side_encryption_configuration" "s3-terraform-state-backup-encryption" {
  bucket = aws_s3_bucket.s3-terraform-state-backup-name.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = var.s3-terraform-state-backup-encryption_id
    }
  }
}