output "s3_bucket_name" {
  description = "Name of the S3 bucket used for Terraform state storage"
  value       = aws_s3_bucket.s3-terraform-state-backup-name.id
}

output "s3_bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = aws_s3_bucket.s3-terraform-state-backup-name.arn
}

output "s3_bucket_endpoint" {
  description = "Endpoint URL of the S3 bucket"
  value       = aws_s3_bucket.s3-terraform-state-backup-name.bucket_domain_name
}

output "s3_bucket_url" {
  description = "Full HTTPS URL endpoint of the S3 bucket"
  value       = "https://${aws_s3_bucket.s3-terraform-state-backup-name.bucket_domain_name}"
}