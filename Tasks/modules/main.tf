terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

module "s3-terraform-state-backup-name" {
  source = "./s3bucket"
}

module "s3-terraform-state-backup-versioning" {
  source = "./s3bucket"
}

module "s3-terraform-state-backup-encryption" {
  source = "./s3bucket"
}

module "s3-terraform-state-backup-object-lock" {
  source = "./s3bucket"
  #aws_bucket_name          = var.s3-terraform-state-backup-name_id
  #versioning_status    = var.s3-terraform-state-backup-versioning_id
  #encryption_algorithm = var.s3-terraform-state-backup-encryption_id
}

module "s3-terraform-iam-state-policy" {
  source = "./s3bucket"
}

module "terraform-state-backup-to-s3" {
  source = "./s3bucket"
}

