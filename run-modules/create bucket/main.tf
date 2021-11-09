# Define providers
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.89.0"
    }
  }
}

# Specify the GCP Provider

provider "google" {
  credentials = file(var.gcp_auth_file)
  project = var.gcp_project_id
  region  = var.gcp_region
  zone = var.gcp_zone
}

# Create a GCS Bucket
resource "google_storage_bucket" "tf-bucket" {
  project       = var.gcp_project_id
  name          = var.bucket_name
  location      = var.gcp_region
  force_destroy = var.force_destroy
  storage_class = var.storage-class
  versioning {
    enabled = var.versioning_enabled
  }
}