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
| <a name="bucket-lifecycle-config"></a> [object\_complete](#module\_object\_complete) | ../../modules/s3bucket/lifecycle | n/a |
| <a name="s3-bucket"></a> [object\_locked](#module\_object\_locked) | ../../modules/s3bucket/s3 | n/a |
| <a name="bucket-versioning"></a> [object\_with\_override\_default\_tags](#module\_object\_with\_override\_default\_tags) | ../../modules/s3bucket/versioning | n/a |


## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="s3-bucket-name-output"></a> [s3\_bucket\_id](#output\_s3\_bucket\_id) | The name of the bucket. |
| <a name="s3-bucket-arn-output"></a> [s3\_bucket\_arn](#output\_s3\_bucket\_arn) | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname.|
| <a name="s3-bucket-endpoint-output"></a> [s3\_object\_etag](#output\_s3\_object\_etag) | The ETag generated for the object (an MD5 sum of the object content). |
| <a name="s3-bucket-url-output"></a> [s3\_object\_id](#output\_s3\_object\_id) | The key of S3 object |
<!-- END_TF_DOCS -->
