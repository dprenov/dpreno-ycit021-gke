## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 3.89.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | ~> 3.89.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gke_tformers"></a> [gke\_tformers](#module\_gke\_tformers) | ./modules/gke | n/a |
| <a name="module_vpc_tformers"></a> [vpc\_tformers](#module\_vpc\_tformers) | ./modules/vpc | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | The billing account associated to the project | `string` | n/a | yes |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | GCS Bucket name. Value should be unique. | `string` | `"tf-bucket-ycit021"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The prefix to add to object names indicating the environment intended when create | `string` | `"dev"` | no |
| <a name="input_gcp_auth_file"></a> [gcp\_auth\_file](#input\_gcp\_auth\_file) | GCP authentication file for the GCP service account key in JSON format | `string` | `"./terraform-svc.json"` | no |
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The GCP project ID | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | The GCP Region where elements will be created | `string` | `"us-central1"` | no |
| <a name="input_gcp_zone"></a> [gcp\_zone](#input\_gcp\_zone) | The GCP Zone where elements will be created | `string` | `"us-central1-c"` | no |

## Outputs

No outputs.
