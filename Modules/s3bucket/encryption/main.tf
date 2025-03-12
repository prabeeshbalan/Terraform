# Enable Server-Side Encryption (SSE) on S3 Bucket
resource "aws_s3_bucket_server_side_encryption_configuration" "bucket-encryption" {
  bucket = var.s3-bucket-name

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = var.bucket-encryption-value
    }
  }
}