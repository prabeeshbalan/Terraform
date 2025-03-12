variable "s3-terraform-state-backup-name_id" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "test-s3-terraform-state-backup-4-output"
}
variable "s3-terraform-state-backup-encryption_id" {
  description = "Encryption algorithm (e.g., AES256)"
  type        = string
  default     = "AES256"
}
