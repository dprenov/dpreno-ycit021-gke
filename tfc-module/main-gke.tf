terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.89.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 3.89.0"

    }
  }
}

provider "google" {
  credentials = file(var.gcp_auth_file)
  project = var.gcp_project_id
  region  = var.gcp_region
  zone = var.gcp_zone
}

provider "google-beta" {
  credentials = file("terraform-svc.json")
  project = var.gcp_project_id
  region  = var.gcp_region
  zone = var.gcp_zone
}

locals {
    tfenvironment = terraform.workspace
}

module "vpc_tformers" {
  source  = "app.terraform.io/Tformers/cmvpc/gcp"
  version = "1.0.2"
  # insert required variables here

#PROJECT info
  gcp_region      = var.gcp_region
  gcp_project_id  = var.gcp_project_id  # has to be unique "crack-photon-306705" 
  org             = "students" #Update
  product         = format("tformers-%s", local.tfenvironment)
  environment     = format("%s-%s", var.environment, local.tfenvironment)
  
  
#VPC specific 
  network_cidr       = "10.128.1.0/26"
  pods_cidr          = "172.0.0.0/18"
  pods_cidr_name     = "pods"
  services_cidr      = "172.10.0.0/21"
  private_ip_google_access = true
  services_cidr_name = "services"
  subnet_log_config_aggregation_interval = "INTERVAL_15_MIN"
  subnet_log_config_flow_sampling        = 0.1
  subnet_log_config_metadata             = "INCLUDE_ALL_METADATA"
  
  nat_ip_allocate_option                 = "AUTO_ONLY"
  nat_source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  nat_log_config_filter                  = "ALL"
  nat_log_config_enable                  = true
}


module "gke_tformers" {
  source  = "app.terraform.io/Tformers/cmgke/gcp"
  version = "1.0.2"
  # insert required variables here

#PROJECT info
  billing_account = var.billing_account #"017C0F-A57C09-F95161"
  project_name    = var.gcp_project_id
  gcp_region      = var.gcp_region
  gcp_project_id  = var.gcp_project_id  # has to be unique 
  org             = "tformers" #Update
  product         = format("ycit-%s", local.tfenvironment)
  environment     = format("%s-%s", var.environment, local.tfenvironment)
  
#VPC specific
  vpc_network     = module.vpc_tformers.vpc_selflink
  subnet_selflink = module.vpc_tformers.subnet_selflink
  
#GKE specific
  
  enable_private_nodes   = "true"
  master_ipv4_cidr_block = "172.16.0.0/28"
  pods_range_name        = "pods"
  services_range_name    = "services"
  kubernetes_version     = "1.20.10-gke.1600"
  initial_node_count     = 1 
  remove_default_node_pool= true
  node_pool_management_auto_repair  = true
  node_pool_management_auto_upgrade = true
  cluster_timeout_create = "30m"
  cluster_timeout_update = "30m"
  cluster_timeout_delete = "30m"
  
#NODE pool  specifc
  node_preemptible      = true  
  node_pool_name        = format("main-pool-%s", local.tfenvironment)
  gke_pool_node_count   = "1"
  gke_pool_image_type   = "COS"
  gke_pool_disk_size_gb = "100"
  gke_pool_disk_type    = "pd-standard"
  gke_pool_machine_type = "e2-small"
  node_config_timeout_create = "10m"
  node_config_timeout_delete = "10m"

}
