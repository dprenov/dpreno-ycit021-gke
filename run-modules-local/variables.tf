#For Terraform Cloud section - backend
variable "terraform_cloud_organisation" {
  type        = string
  description = "The organisation name in the Terraform Cloud used for the backend"
  default     = "Tformers"
}

# GCP authentication file
variable "gcp_auth_file" {
  type        = string
  description = "GCP authentication file for the GCP service account key in JSON format"
  default     = "./terraform-svc.json"
}

# Google Cloud variable section

variable "gcp_project_id" {
  type        = string
  description = "The GCP project ID"
}

variable "billing_account" {
  type        = string
  description = "The billing account associated to the project"
}

variable "gcp_region" {
  type        = string
  description = "The GCP Region where elements will be created"
  default     = "us-central1"
}

variable "gcp_zone" {
  type        = string
  description = "The GCP Zone where elements will be created"
  default     = "us-central1-c"
}

variable "org" {
  type        = string
  description = "The organisation name to tied the computre resource - for academic purposes it can be student initials"
  default     = "ycit"
}

variable "environment" {
  type        = string
  description = "The prefix to add to object names indicating the environment intended when create"
  default     = "dev"
}

variable "network_cidr_range" {
  type        = string
  description = "The IPv4 range  in CIDR notation when creating the VPC for the network."
}

variable "pods_cidr_range" {
  type        = string
  description = "The IPv4 range  in CIDR notation when creating the VPC for the pods."
}

variable "pods_cidr_name" {
  type        = string
  description = "The pods CIDR name"
  default     = "pod-d"
}

variable "services_cidr_range" {
  type        = string
  description = "The IPv4 range  in CIDR notation for the services when creating the VPC."
}

variable "services_cidr_name" {
  type        = string
  description = "The name to assign to the service CIDR range."
  default     = "serv-d"
}

variable "master_ipv4_cidr_block_range" {
  type        = string
  description = "The IPv4 range in CIDR notation for the Master IP values in GKE (for the Kubectl API)."
}

variable "initial_node_count" {
  type        = number
  description = "The minimum node count for the cluster"
  default     = 1
}

variable "node_preemptible" {
  type        = bool
  description = "Value for the node_preemptible parameter whether the resource needs to stay always ON or not."
  default     = true
}

variable "gke_pool_machine_type" {
  description = "Machine type for the pool of compute resources in the GKE."
  type        = string
  default     = "e2-small"
}

variable "bucket_name" {
  description = "GCS Bucket name. Value should be unique."
  type        = string
  default     = "tf-bucket-ycit021"
}
