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

# Enable Versioning on S3 Bucket
resource "aws_s3_bucket_versioning" "s3-terraform-state-backup-versioning" {
  bucket = aws_s3_bucket.s3-terraform-state-backup-name.id
  versioning_configuration {
    status = var.s3-terraform-state-backup-versioning_id
  }
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

resource "aws_s3_bucket_object_lock_configuration" "s3-terraform-state-backup-object-lock" {
  bucket = aws_s3_bucket.s3-terraform-state-backup-name.id
  rule {
    default_retention {
      mode = "COMPLIANCE"
      days = 5
    }
  }
  depends_on = [aws_s3_bucket_versioning.s3-terraform-state-backup-versioning]
}

# IAM Policy for Terraform State Access (read and write)
data "aws_iam_policy_document" "s3-terraform-iam-state-access" {
  statement {
    actions = [
      "s3:ListBucket",
      "s3:GetObject",
      "s3:PutObject",
    ]
    resources = [
      aws_s3_bucket.s3-terraform-state-backup-name.arn,
      "${aws_s3_bucket.s3-terraform-state-backup-name.arn}/*"
    ]
  }
}

resource "aws_iam_policy" "s3-terraform-iam-state-policy" {
  name        = "TerraformStateAccessPolicy"
  description = "Policy for Terraform to access S3 with read and write permision"
  policy      = data.aws_iam_policy_document.s3-terraform-iam-state-access.json
}

# Attach this policy to your IAM user/role executing Terraform