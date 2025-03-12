resource "aws_s3_bucket_lifecycle_configuration" "bucket-lifecycle-config" {
  #depends_on = [aws_s3_bucket_versioning.bucket-versioning-name]
  depends_on = [var.bucket-versioning-name]
  bucket     = var.s3-bucket-name

  rule {
    id     = "ProtectLifecycleRule"
    status = "Enabled"

    filter { prefix = "Protect" }

    # Transitions for CURRENT versions
    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = 100
      storage_class = "GLACIER_IR"
    }

    transition {
      days          = 200
      storage_class = "GLACIER"
    }

    transition {
      days          = 365
      storage_class = "DEEP_ARCHIVE"
    }

    # Transitions for NON-CURRENT versions
    noncurrent_version_transition {
      noncurrent_days = 30
      storage_class   = "STANDARD_IA"
    }

    noncurrent_version_transition {
      noncurrent_days = 100
      storage_class   = "GLACIER_IR"
    }

    noncurrent_version_transition {
      noncurrent_days = 200
      storage_class   = "GLACIER"
    }

    noncurrent_version_transition {
      noncurrent_days = 365
      storage_class   = "DEEP_ARCHIVE"
    }

    # Expire non-current versions
    noncurrent_version_expiration {
      noncurrent_days = 400
    }
  }
}