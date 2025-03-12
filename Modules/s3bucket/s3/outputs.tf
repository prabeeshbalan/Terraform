output "s3-bucket-name-output" {
  description = "Name of the S3 bucket used for Terraform state storage"
  value       = aws_s3_bucket.s3-bucket.id
}

output "s3-bucket-arn-output" {
  description = "ARN of the S3 bucket"
  value       = aws_s3_bucket.s3-bucket.arn
}

output "s3-bucket-endpoint-output" {
  description = "Endpoint URL of the S3 bucket"
  value       = aws_s3_bucket.s3-bucket.bucket_domain_name
}

output "s3-bucket-url-output" {
  description = "Full HTTPS URL endpoint of the S3 bucket"
  value       = "https://${aws_s3_bucket.s3-bucket.bucket_domain_name}"
}