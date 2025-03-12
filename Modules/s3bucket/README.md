AWS S3 Bucket Terraform Module

Overview

This Terraform configuration creates an AWS S3 bucket with a minimal configuration and supports S3 bucket objects with different configurations.

Prerequisites

Terraform installed (>= 1.0)

AWS CLI installed and configured with appropriate credentials

A globally unique bucket name

Usage

1. Initialize Terraform

Run the following command to initialize the Terraform workspace:

terraform init

2. Plan the Deployment

Preview the resources that Terraform will create:

terraform plan

3. Apply the Configuration

Create the S3 bucket and objects by running:

terraform apply

Type yes when prompted.

4. View the Output

After successful deployment, Terraform will output the bucket and object details:

terraform output s3_bucket_arn
terraform output s3_bucket_id
terraform output s3_object_etag
terraform output s3_object_id
terraform output s3_object_version_id

5. Cleanup

To destroy the created resources, run:

terraform destroy

Type yes when prompted.

Configuration Details

Modules

Name

Source

Version

object

../../modules/s3bucket/encryption

n/a

object_complete

../../modules/s3bucket/lifecycle

n/a

object_locked

../../modules/s3bucket/s3

n/a

object_with_override_default_tags

../../modules/s3bucket/versioning

n/a

s3_bucket

../../

n/a

s3_bucket_with_object_lock

../../

n/a


resource

Notes

The bucket name must be globally unique.

Modify the provider block to specify a different AWS region if needed.

Ensure that your AWS IAM user has s3:CreateBucket permission.

This example may create resources that cost money. Run terraform destroy when you no longer need them.
