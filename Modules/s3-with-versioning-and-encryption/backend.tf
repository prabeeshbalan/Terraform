#Move backend.tf only after initial terraform apply executed. which will create the s3 and then apply backend.tf
terraform {
  backend "s3" {
    # Replace with your S3 bucket name (must already exist)
    #path = "state/terraform.tfstate"
    bucket = "test-s3-terraform-state-backup"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
