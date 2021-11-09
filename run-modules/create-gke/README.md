## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 3.89.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | ~> 3.89.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gke_tformers"></a> [gke\_tformers](#module\_gke\_tformers) | app.terraform.io/Terraformers21/modgke/gcp | 1.0.2 |
| <a name="module_vpc_tformers"></a> [vpc\_tformers](#module\_vpc\_tformers) | app.terraform.io/Terraformers21/modvpc/gcp | 1.0.2 |

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
| <a name="input_gke_pool_machine_type"></a> [gke\_pool\_machine\_type](#input\_gke\_pool\_machine\_type) | Machine type for the pool of compute resources in the GKE. | `string` | `"e2-small"` | no |
| <a name="input_initial_node_count"></a> [initial\_node\_count](#input\_initial\_node\_count) | The minimum node count for the cluster | `number` | `1` | no |
| <a name="input_master_ipv4_cidr_block_range"></a> [master\_ipv4\_cidr\_block\_range](#input\_master\_ipv4\_cidr\_block\_range) | The IPv4 range in CIDR notation for the Master IP values in GKE (for the Kubectl API). | `string` | n/a | yes |
| <a name="input_network_cidr_range"></a> [network\_cidr\_range](#input\_network\_cidr\_range) | The IPv4 range  in CIDR notation when creating the VPC for the network. | `string` | n/a | yes |
| <a name="input_node_preemptible"></a> [node\_preemptible](#input\_node\_preemptible) | Value for the node\_preemptible parameter whether the resource needs to stay always ON or not. | `bool` | `true` | no |
| <a name="input_org"></a> [org](#input\_org) | The organisation name to tied the computre resource - for academic purposes it can be student initials | `string` | `"ycit"` | no |
| <a name="input_pods_cidr_name"></a> [pods\_cidr\_name](#input\_pods\_cidr\_name) | The pods CIDR name | `string` | `"pod-d"` | no |
| <a name="input_pods_cidr_range"></a> [pods\_cidr\_range](#input\_pods\_cidr\_range) | The IPv4 range  in CIDR notation when creating the VPC for the pods. | `string` | n/a | yes |
| <a name="input_services_cidr_name"></a> [services\_cidr\_name](#input\_services\_cidr\_name) | The name to assign to the service CIDR range. | `string` | `"serv-d"` | no |
| <a name="input_services_cidr_range"></a> [services\_cidr\_range](#input\_services\_cidr\_range) | The IPv4 range  in CIDR notation for the services when creating the VPC. | `string` | n/a | yes |
| <a name="input_terraform_cloud_organisation"></a> [terraform\_cloud\_organisation](#input\_terraform\_cloud\_organisation) | The organisation name in the Terraform Cloud used for the backend | `string` | `"Tformers"` | no |

## Outputs

No outputs.
