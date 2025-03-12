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
module "s3-bucket" {
  source          = "./s3"
  s3-bucket-name  = "test-s3-for-test-terraform-module"
  aws-region-name = "us-east-1"
}
module "bucket-versioning" {
  source                  = "./versioning"
  s3-bucket-name          = module.s3-bucket.s3-bucket-name-output
  bucket-versioning-value = "Enabled"
}
module "bucket-lifecycle-config" {
  source                 = "./lifecycle"
  s3-bucket-name         = module.s3-bucket.s3-bucket-name-output
  bucket-versioning-name = module.bucket-versioning.bucket-versioning-output
}
module "bucket-encryption" {
  source                  = "./encryption"
  s3-bucket-name          = module.s3-bucket.s3-bucket-name-output
  bucket-encryption-value = "AES256"
}

output "s3-bucket-name-output" {
  description = "Name of the S3 bucket used for Terraform state storage"
  value       = module.s3-bucket.s3-bucket-name-output
}

output "s3-bucket-arn-output" {
  description = "ARN of the S3 bucket"
  value       = module.s3-bucket.s3-bucket-arn-output
}

output "s3-bucket-endpoint-output" {
  description = "Endpoint URL of the S3 bucket"
  value       = module.s3-bucket.s3-bucket-endpoint-output
}

output "s3-bucket-url-output" {
  description = "Full HTTPS URL endpoint of the S3 bucket"
  value       = "https://${module.s3-bucket.s3-bucket-url-output}"
}