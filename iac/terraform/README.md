# terraform

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.1.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.2.0 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.1.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | ~> 3.0 |

## Resources

| Name | Type |
|------|------|
| [aws_kms_alias.mairror_sops_alias](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.mairror_sops](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_s3_account_public_access_block.mairror_block](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_account_public_access_block) | resource |
| [aws_s3_bucket.mairror_images](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.mairror_bucket_acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_lifecycle_configuration.mairror_versioning_bucket_config](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration) | resource |
| [aws_s3_bucket_notification.mairror_bucket_notification](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_notification) | resource |
| [aws_security_group.all_worker_mgmt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.worker_group_mgmt_one](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.worker_group_mgmt_two](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_sqs_queue.predict_queue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |
| [aws_sqs_queue.raw_queue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |
| [aws_vpc_endpoint.s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [null_resource.network_value](https://registry.terraform.io/providers/hashicorp/null/3.1.0/docs/resources/resource) | resource |
| [aws_availability_zones.frankfurt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_mairror_bucket_name"></a> [mairror\_bucket\_name](#input\_mairror\_bucket\_name) | Bucket name to save images | `string` | `"mairror-images"` | no |
| <a name="input_predict_queue_name"></a> [predict\_queue\_name](#input\_predict\_queue\_name) | Queue used for the predictions | `string` | `"mairror-predict"` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The project's name | `string` | `"mairror"` | no |
| <a name="input_raw_queue_name"></a> [raw\_queue\_name](#input\_raw\_queue\_name) | Raw queue mairror for getting event notification from s3 | `string` | `"mairror-raw"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS Region to use by the provider | `string` | `"eu-central-1"` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | VPC cidr to use | `string` | `"10.20.0.0/16"` | no |
| <a name="input_vpc_cidr_private_subnets"></a> [vpc\_cidr\_private\_subnets](#input\_vpc\_cidr\_private\_subnets) | Private subnets cidr az-1, az-2, az-3 | `list(string)` | <pre>[<br>  "10.20.0.0/24",<br>  "10.20.1.0/24",<br>  "10.20.2.0/24"<br>]</pre> | no |
| <a name="input_vpc_cidr_public_subnets"></a> [vpc\_cidr\_public\_subnets](#input\_vpc\_cidr\_public\_subnets) | Public subnets cidr az-1, az-2, az-3 | `list(string)` | <pre>[<br>  "10.20.10.0/24",<br>  "10.20.11.0/24",<br>  "10.20.12.0/24"<br>]</pre> | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | VPC name | `string` | `"mairror-vpc"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kms_key"></a> [kms\_key](#output\_kms\_key) | KMS key arn |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
