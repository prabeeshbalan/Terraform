# Enable Versioning on S3 Bucket
resource "aws_s3_bucket_versioning" "bucket-versioning" {
  bucket = var.s3-bucket-name
  versioning_configuration {
    status = var.bucket-versioning-value
  }
}

