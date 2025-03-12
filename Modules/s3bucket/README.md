# S3 bucket object

Configuration in this directory creates S3 bucket objects with different configurations.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.11 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.83 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.83 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="bucket-encryption"></a> [bucket\-encryption](#module\_encryption) | ../../modules/s3bucket/encryption | n/a |
| <a name="bucket-lifecycle-config"></a> [bucket\-lifecycle\-config](#module\_object\_complete) | ../../modules/s3bucket/lifecycle | n/a |
| <a name="s3-bucket"></a> [s3\-bucket](#module\_object\_locked) | ../../modules/s3bucket/s3 | n/a |
| <a name="bucket-versioning"></a> [bucket\-versioning](#module\_object\_with\_override\_default\_tags) | ../../modules/s3bucket/versioning | n/a |


## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="s3-bucket-name-output"></a> [s3\-bucket\-name\-output](#s3\-bucket\-name\-output) | The name of the s3 bucket. |
| <a name="s3-bucket-arn-output"></a> [s3\-bucket\-arn\-output](#s3\-bucket\-arn\-output) | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname.|
| <a name="s3-bucket-endpoint-output"></a> [s3\-bucket\-endpoint\-output](#s3\-bucket\-endpoint\-output) | The end point URL of the bucket. |
| <a name="s3-bucket-url-output"></a> [s3\-bucket\-url\-output](#s3\-bucket\-url\-output) | Full HTTPS URL endpoint of the S3 bucket. |
<!-- END_TF_DOCS -->
