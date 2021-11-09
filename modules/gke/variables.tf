
variable "billing_account" {
  type        = string
  description = "The billing account ID for this project"
}

variable "project_name" {
  type        = string
  description = "The human readable project name (min 4 letters)"
}

variable "gcp_project_id" {
  type        = string
  description = "The GCP project ID to use for the resource creation"
  default     = ""
}

variable "gcp_region" {
  type        = string
  description = "The GCP Region"
  default     = "us-central1"
}

variable "org" {
    type = string
    description= "An Organization identifier"
}
variable "product" {
    type = string
    description= "An identifier as a product or service the resources will be associated"
}
variable "environment" {
    type = string
    description= "This will be added in the name of the resource to help identifying the environment"
	default = "dev"
}

variable "vpc_network" {
    type = string
    description = "the vpc network name, the self_link name returned when VPC is created"
}

variable "subnet_selflink" {
    type = string
    description = "the subnet link name"
}

variable "routing_mode" {
    type = string
    default = "REGIONAL"
    description = "Routing mode"
}
variable "description" {
    type = string
    default = "VPC that will be used by the GKE private cluster on the related project"
    description = "Description of VPC"
}

variable "auto_create_network" {
  type = bool
  description = "Value true or false if Automatically provision a default global VPC network"
  default     = false
}

variable "auto_create_subnetworks" {
    type = bool
    default = false
    description = "Value true or false if enable Auto create sub networks"
}

variable "kubernetes_version" {
  type        = string
  description = "The GKE version of Kubernetes"
  default     = ""
}

variable "logging_service" {
  type        = string
  description = "The logging service that the cluster should write logs to."
  default     = "logging.googleapis.com/kubernetes"
}

variable "initial_node_count" {
  type        = number
  description = "The initial node count for the cluster."
  default     = 1
}

variable "monitoring_service" {
  type        = string
  description = "The GCP monitoring service scope"
  default     = "monitoring.googleapis.com/kubernetes"
}


variable "remove_default_node_pool" {
  type        = bool
  description = "Boolean value if removal of default node pool will happen"
  default     = true
}

variable "disable_http_load_balancing" {
  type        = bool
  description = "Enable HTTP Load balancing GCP integration"
  default     = false
}

variable "disable_horizontal_pod_autoscaling" {
  type        = bool
  description = "Enable Horizontal Pod Autoscaling addon"
  default     = false
}

variable "maintenance_start_time" {
  type        = string
  description = "Time window specified for daily or recurring maintenance operations in RFC3339 format"
  default = "05:00"
}

variable "cluster_timeout_create" {
  type        = string
  description = "Time-out value for cluster create parameter"
  default     = "30m"
}

variable "cluster_timeout_update" {
  type        = string
  description = "Time-out value for cluster update parameter"
  default     = "30m"
}

variable "cluster_timeout_delete" {
  type        = string
  description = "Time-out value for cluster delete parameter"
  default     = "30m"
}

variable "network_policy" {
  type        = bool
  description = "Enable network policy addon"
  default     = true
}

variable "pods_range_name" {
  type        = string
  description = "The pre-defined IP Range the Cluster should use to provide IP addresses to pods"
  default     = ""
}

variable "services_range_name" {
  type        = string
  description = "The pre-defined IP Range the Cluster should use to provide IP addresses to services"
  default     = ""
}

variable "enable_private_nodes" {
  type        = bool
  default     = false
  description = "Enable Private-IP Only GKE Nodes"
}

variable "enable_private_endpoint" {
  type        = bool
  default     = false
  description = "When true, the cluster's private endpoint is used as the cluster endpoint and access through the public endpoint is disabled."
}

variable "master_ipv4_cidr_block" {
  description = "The ipv4 cidr block that the GKE masters use"
}

#Node Pool specific variables	

variable "node_pool_name" {
  type        = string
  description = "The name for the node pool to be created. Cloud provider might impose a limit in number of characters"
  default     = "main-pool"
}

variable "gke_pool_node_count" {
  type = number
  description = "The count of nodes to define for the node pool"
}

#Node pool management
variable "node_pool_management_auto_repair" {
  type        = bool
  description = "Autorepair flag for te node"
  default     = true
}

variable "node_pool_management_auto_upgrade" {
  type        = bool
  description = "Autoupgrade flag for te node"
  default     = true
}

#Node config
variable "node_preemptible" {
  type        = bool
  description = "Flag indicates if node will be pre-emptible or not"
  default     = true
}

variable "gke_pool_image_type" {
  type = string
  description = "The image type for the node pool"
}

variable "gke_pool_disk_size_gb" {
  type = string
  description = "The size in GB for the node pool resource"
}

variable "gke_pool_disk_type" {
  type        = string
  description = "The disk type for the node pool resource"
  default = "pd-standard"
}

variable "gke_pool_machine_type" {
  type        = string
  description = "The type of machine to define for the pool"
  default     = "e2-small"
}

variable "node_config_timeout_create" {
  type        = string
  description = "Time-out value for create parameter"
  default     = "10m"
}

variable "node_config_timeout_delete" {
  type        = string
  description = "Time-out value for delete parameter"
  default     = "10m"
}



