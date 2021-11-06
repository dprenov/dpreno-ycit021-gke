## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_firewall.ssh-rule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_network.vpc_network](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) | resource |
| [google_compute_router.gke_net_router](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router) | resource |
| [google_compute_router_nat.gke_cloud_nat](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_nat) | resource |
| [google_compute_subnetwork.gke_private_subnet](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_create_network"></a> [auto\_create\_network](#input\_auto\_create\_network) | Automatically provision a default global VPC network | `bool` | `false` | no |
| <a name="input_auto_create_subnetworks"></a> [auto\_create\_subnetworks](#input\_auto\_create\_subnetworks) | Enable Auto create sub networks | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | Description of VPC | `string` | `"VPC that will be used by the GKE private cluster on the related project"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment | `string` | n/a | yes |
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The newly created GCP project ID | `string` | `""` | no |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | The GCP Region | `string` | `"us-central1"` | no |
| <a name="input_nat_ip_allocate_option"></a> [nat\_ip\_allocate\_option](#input\_nat\_ip\_allocate\_option) | IP allocation option for the Cloud NAT resource | `string` | `"AUTO_ONLY"` | no |
| <a name="input_nat_log_config_enable"></a> [nat\_log\_config\_enable](#input\_nat\_log\_config\_enable) | Log config opeion for the Cloud NAT resource | `bool` | `true` | no |
| <a name="input_nat_log_config_filter"></a> [nat\_log\_config\_filter](#input\_nat\_log\_config\_filter) | Filter to apply on the Cloud NAT log config | `string` | `"ALL"` | no |
| <a name="input_nat_source_subnetwork_ip_ranges_to_nat"></a> [nat\_source\_subnetwork\_ip\_ranges\_to\_nat](#input\_nat\_source\_subnetwork\_ip\_ranges\_to\_nat) | IP Range NAT mode | `string` | `"ALL_SUBNETWORKS_ALL_IP_RANGES"` | no |
| <a name="input_network_cidr"></a> [network\_cidr](#input\_network\_cidr) | CIDR IPv4 range for the network | `string` | n/a | yes |
| <a name="input_org"></a> [org](#input\_org) | Organization | `string` | n/a | yes |
| <a name="input_pods_cidr"></a> [pods\_cidr](#input\_pods\_cidr) | CIDR IPv4 range for the pods | `string` | n/a | yes |
| <a name="input_pods_cidr_name"></a> [pods\_cidr\_name](#input\_pods\_cidr\_name) | Name for the CIDR IPv4 range on the pods | `string` | n/a | yes |
| <a name="input_private_ip_google_access"></a> [private\_ip\_google\_access](#input\_private\_ip\_google\_access) | Either subnet will have access ip\_google\_access enabled or not | `bool` | `true` | no |
| <a name="input_product"></a> [product](#input\_product) | Product | `string` | n/a | yes |
| <a name="input_routing_mode"></a> [routing\_mode](#input\_routing\_mode) | Routing mode | `string` | `"REGIONAL"` | no |
| <a name="input_services_cidr"></a> [services\_cidr](#input\_services\_cidr) | CIDR IPv4 range for the services | `string` | n/a | yes |
| <a name="input_services_cidr_name"></a> [services\_cidr\_name](#input\_services\_cidr\_name) | Name for the CIDR IPv4 range on for services | `string` | n/a | yes |
| <a name="input_subnet_log_config_aggregation_interval"></a> [subnet\_log\_config\_aggregation\_interval](#input\_subnet\_log\_config\_aggregation\_interval) | log aggregation interval to set-up | `string` | `"INTERVAL_15_MIN"` | no |
| <a name="input_subnet_log_config_flow_sampling"></a> [subnet\_log\_config\_flow\_sampling](#input\_subnet\_log\_config\_flow\_sampling) | Log flow sampling option for the subnet | `number` | `0.1` | no |
| <a name="input_subnet_log_config_metadata"></a> [subnet\_log\_config\_metadata](#input\_subnet\_log\_config\_metadata) | log metadata option to set-up | `string` | `"INCLUDE_ALL_METADATA"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | n/a |
| <a name="output_subnet_selflink"></a> [subnet\_selflink](#output\_subnet\_selflink) | n/a |
| <a name="output_vpc_name"></a> [vpc\_name](#output\_vpc\_name) | n/a |
| <a name="output_vpc_network_selflink"></a> [vpc\_network\_selflink](#output\_vpc\_network\_selflink) | n/a |
| <a name="output_vpc_selflink"></a> [vpc\_selflink](#output\_vpc\_selflink) | n/a |
