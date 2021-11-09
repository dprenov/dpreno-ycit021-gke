## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 3.0.89 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | ~> 3.0.89 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_storage_bucket.tf-bucket](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | The billing account associated to the project | `string` | n/a | yes |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | GCS Bucket name. Value should be unique. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The prefix to add to object names indicating the environment intended when create | `string` | `"dev"` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | Value for the bucket parameter force\_destroy | `bool` | `true` | no |
| <a name="input_gcp_auth_file"></a> [gcp\_auth\_file](#input\_gcp\_auth\_file) | GCP authentication file for the GCP service account key in JSON format | `string` | `"./terraform-svc.json"` | no |
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The GCP project ID | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | The GCP Region where elements will be created | `string` | `"us-central1"` | no |
| <a name="input_gcp_zone"></a> [gcp\_zone](#input\_gcp\_zone) | The GCP Zone where elements will be created | `string` | `"us-central1-c"` | no |
| <a name="input_storage-class"></a> [storage-class](#input\_storage-class) | The storage class of the Storage Bucket to create | `string` | n/a | yes |
| <a name="input_versioning_enabled"></a> [versioning\_enabled](#input\_versioning\_enabled) | Value to enable or not the versioning | `bool` | `true` | no |

## Outputs

No outputs.
