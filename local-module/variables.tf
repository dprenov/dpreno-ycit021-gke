# GCP authentication file
variable "gcp_auth_file" {
  type        = string
  description = "GCP authentication file for the GCP service account key in JSON format"
  default     = "./terraform-svc.json"
}

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

variable "environment" {
  type        = string
  description = "The prefix to add to object names indicating the environment intended when create"
  default     = "dev"
}

variable "bucket_name" {
  description = "GCS Bucket name. Value should be unique."
  type        = string
  default     = "tf-bucket-ycit021"
}