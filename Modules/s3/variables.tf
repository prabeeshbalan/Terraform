variable "dev-aws-s3-bucket-name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "test-dev-aws-s3-bucket"
}
variable "dev-aws-s3-bucket-acl" {
  description = "s3 bucket ACL type"
  type        = string
  default     = "private"
}