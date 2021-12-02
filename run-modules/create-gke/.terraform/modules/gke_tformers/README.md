## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google-beta_google_container_cluster.primary_cluster](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_container_cluster) | resource |
| [google-beta_google_container_node_pool.custom-node_pool](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_container_node_pool) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_create_network"></a> [auto\_create\_network](#input\_auto\_create\_network) | Value true or false if Automatically provision a default global VPC network | `bool` | `false` | no |
| <a name="input_auto_create_subnetworks"></a> [auto\_create\_subnetworks](#input\_auto\_create\_subnetworks) | Value true or false if enable Auto create sub networks | `bool` | `false` | no |
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | The billing account ID for this project | `string` | n/a | yes |
| <a name="input_cluster_timeout_create"></a> [cluster\_timeout\_create](#input\_cluster\_timeout\_create) | Time-out value for cluster create parameter | `string` | `"30m"` | no |
| <a name="input_cluster_timeout_delete"></a> [cluster\_timeout\_delete](#input\_cluster\_timeout\_delete) | Time-out value for cluster delete parameter | `string` | `"30m"` | no |
| <a name="input_cluster_timeout_update"></a> [cluster\_timeout\_update](#input\_cluster\_timeout\_update) | Time-out value for cluster update parameter | `string` | `"30m"` | no |
| <a name="input_description"></a> [description](#input\_description) | Description of VPC | `string` | `"VPC that will be used by the GKE private cluster on the related project"` | no |
| <a name="input_disable_horizontal_pod_autoscaling"></a> [disable\_horizontal\_pod\_autoscaling](#input\_disable\_horizontal\_pod\_autoscaling) | Enable Horizontal Pod Autoscaling addon | `bool` | `false` | no |
| <a name="input_disable_http_load_balancing"></a> [disable\_http\_load\_balancing](#input\_disable\_http\_load\_balancing) | Enable HTTP Load balancing GCP integration | `bool` | `false` | no |
| <a name="input_enable_private_endpoint"></a> [enable\_private\_endpoint](#input\_enable\_private\_endpoint) | When true, the cluster's private endpoint is used as the cluster endpoint and access through the public endpoint is disabled. | `bool` | `false` | no |
| <a name="input_enable_private_nodes"></a> [enable\_private\_nodes](#input\_enable\_private\_nodes) | Enable Private-IP Only GKE Nodes | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | This will be added in the name of the resource to help identifying the environment | `string` | `"dev"` | no |
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The GCP project ID to use for the resource creation | `string` | `""` | no |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | The GCP Region | `string` | `"us-central1"` | no |
| <a name="input_gke_pool_disk_size_gb"></a> [gke\_pool\_disk\_size\_gb](#input\_gke\_pool\_disk\_size\_gb) | The size in GB for the node pool resource | `string` | n/a | yes |
| <a name="input_gke_pool_disk_type"></a> [gke\_pool\_disk\_type](#input\_gke\_pool\_disk\_type) | The disk type for the node pool resource | `string` | `"pd-standard"` | no |
| <a name="input_gke_pool_image_type"></a> [gke\_pool\_image\_type](#input\_gke\_pool\_image\_type) | The image type for the node pool | `string` | n/a | yes |
| <a name="input_gke_pool_machine_type"></a> [gke\_pool\_machine\_type](#input\_gke\_pool\_machine\_type) | The type of machine to define for the pool | `string` | `"e2-small"` | no |
| <a name="input_gke_pool_node_count"></a> [gke\_pool\_node\_count](#input\_gke\_pool\_node\_count) | The count of nodes to define for the node pool | `number` | n/a | yes |
| <a name="input_initial_node_count"></a> [initial\_node\_count](#input\_initial\_node\_count) | The initial node count for the cluster. | `number` | `1` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | The GKE version of Kubernetes | `string` | `""` | no |
| <a name="input_logging_service"></a> [logging\_service](#input\_logging\_service) | The logging service that the cluster should write logs to. | `string` | `"logging.googleapis.com/kubernetes"` | no |
| <a name="input_maintenance_start_time"></a> [maintenance\_start\_time](#input\_maintenance\_start\_time) | Time window specified for daily or recurring maintenance operations in RFC3339 format | `string` | `"05:00"` | no |
| <a name="input_master_ipv4_cidr_block"></a> [master\_ipv4\_cidr\_block](#input\_master\_ipv4\_cidr\_block) | The ipv4 cidr block that the GKE masters use | `any` | n/a | yes |
| <a name="input_monitoring_service"></a> [monitoring\_service](#input\_monitoring\_service) | The GCP monitoring service scope | `string` | `"monitoring.googleapis.com/kubernetes"` | no |
| <a name="input_network_policy"></a> [network\_policy](#input\_network\_policy) | Enable network policy addon | `bool` | `true` | no |
| <a name="input_node_config_timeout_create"></a> [node\_config\_timeout\_create](#input\_node\_config\_timeout\_create) | Time-out value for create parameter | `string` | `"10m"` | no |
| <a name="input_node_config_timeout_delete"></a> [node\_config\_timeout\_delete](#input\_node\_config\_timeout\_delete) | Time-out value for delete parameter | `string` | `"10m"` | no |
| <a name="input_node_pool_management_auto_repair"></a> [node\_pool\_management\_auto\_repair](#input\_node\_pool\_management\_auto\_repair) | Autorepair flag for te node | `bool` | `true` | no |
| <a name="input_node_pool_management_auto_upgrade"></a> [node\_pool\_management\_auto\_upgrade](#input\_node\_pool\_management\_auto\_upgrade) | Autoupgrade flag for te node | `bool` | `true` | no |
| <a name="input_node_pool_name"></a> [node\_pool\_name](#input\_node\_pool\_name) | The name for the node pool to be created. Cloud provider might impose a limit in number of characters | `string` | `"main-pool"` | no |
| <a name="input_node_preemptible"></a> [node\_preemptible](#input\_node\_preemptible) | Flag indicates if node will be pre-emptible or not | `bool` | `true` | no |
| <a name="input_org"></a> [org](#input\_org) | An Organization identifier | `string` | n/a | yes |
| <a name="input_pods_range_name"></a> [pods\_range\_name](#input\_pods\_range\_name) | The pre-defined IP Range the Cluster should use to provide IP addresses to pods | `string` | `""` | no |
| <a name="input_product"></a> [product](#input\_product) | An identifier as a product or service the resources will be associated | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The human readable project name (min 4 letters) | `string` | n/a | yes |
| <a name="input_remove_default_node_pool"></a> [remove\_default\_node\_pool](#input\_remove\_default\_node\_pool) | Boolean value if removal of default node pool will happen | `bool` | `true` | no |
| <a name="input_routing_mode"></a> [routing\_mode](#input\_routing\_mode) | Routing mode | `string` | `"REGIONAL"` | no |
| <a name="input_services_range_name"></a> [services\_range\_name](#input\_services\_range\_name) | The pre-defined IP Range the Cluster should use to provide IP addresses to services | `string` | `""` | no |
| <a name="input_subnet_selflink"></a> [subnet\_selflink](#input\_subnet\_selflink) | the subnet link name | `string` | n/a | yes |
| <a name="input_vpc_network"></a> [vpc\_network](#input\_vpc\_network) | the vpc network name, the self\_link name returned when VPC is created | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | The cluster endpoint reference. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the cluster created. |
| <a name="output_master_version"></a> [master\_version](#output\_master\_version) | The master version of the cluster created. |
