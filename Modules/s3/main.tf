# S3 bucket to store data

resource "aws_s3_bucket" "dev-aws-s3-bucket" {
  bucket = var.dev-aws-s3-bucket-name
  acl    = var.dev-aws-s3-bucket-acl

}