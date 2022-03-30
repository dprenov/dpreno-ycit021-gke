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
  #credentials = file(var.gcp_auth_file)
  project = var.gcp_project_id
  region  = var.gcp_region
  zone = var.gcp_zone
}

provider "google-beta" {
  #credentials = file(var.gcp_auth_file)
  project = var.gcp_project_id
  region  = var.gcp_region
  zone = var.gcp_zone
}

locals {
  tfenvironment 	= 	terraform.workspace
	product_string	=	var.product_string
}

# Create VPC first using VPC module

module "vpc_tformers" {
  source  = "app.terraform.io/Terraformers21/modvpc/gcp"
  version = "1.1.0"
  # insert required variables here
  
#PROJECT info
  gcp_region      = var.gcp_region
  gcp_project_id  = var.gcp_project_id  				# has to be unique
  org             = var.org				 				#Update in tfvars
  product         = local.product_string
#  environment     = format("%s", var.environment)
  environment     = terraform.workspace
  
  
#VPC specific 
  network_cidr       = var.network_cidr_range[terraform.workspace]    # "10.128.1.0/26"
  pods_cidr          = var.pods_cidr_range[terraform.workspace]       # "172.0.0.0/18"
  pods_cidr_name     = "${var.pods_cidr_name}-${terraform.workspace}"
  services_cidr      = var.services_cidr_range[terraform.workspace]    # "172.10.0.0/21"
  private_ip_google_access = true
  services_cidr_name = "${var.services_cidr_name}-${terraform.workspace}"

  subnet_log_config_aggregation_interval = "INTERVAL_15_MIN"
  subnet_log_config_flow_sampling        = 0.1
  subnet_log_config_metadata             = "INCLUDE_ALL_METADATA"
  
  nat_ip_allocate_option                 = "AUTO_ONLY"
  nat_source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  nat_log_config_filter                  = "ALL"
  nat_log_config_enable                  = true
}

# Create GKE cluster resource
# Uses outputs from VPC module 

module "gke_tformers" {
  source  = "app.terraform.io/Terraformers21/modgke/gcp"
  version = "1.3.0"
  # insert required variables here

#PROJECT info
  billing_account = var.billing_account 			#
  project_name    = var.gcp_project_id
  gcp_region      = var.gcp_region
  gcp_project_id  = var.gcp_project_id  			# has to be unique 
  org             = var.org
  product         = local.product_string
  #environment     = format("%s", var.environment)
  environment     = terraform.workspace
  
#VPC specific  		# Outputs from module creating the VPC

  vpc_network     = module.vpc_tformers.vpc_selflink
  subnet_selflink = module.vpc_tformers.subnet_selflink
  
#GKE specific
  
  enable_private_nodes   = "true"
  master_ipv4_cidr_block = var.master_ipv4_cidr_block_range[terraform.workspace]     #"172.16.0.0/28"
  pods_range_name        = "${var.pods_cidr_name}-${terraform.workspace}"                  #"pods"
  services_range_name    = "${var.services_cidr_name}-${terraform.workspace}"
  kubernetes_version     = "1.20.15-gke.1000"
  initial_node_count     =  var.initial_node_count 
  remove_default_node_pool= true
  node_pool_management_auto_repair  = true
  node_pool_management_auto_upgrade = true
  cluster_timeout_create = "30m"
  cluster_timeout_update = "30m"
  cluster_timeout_delete = "30m"
  
#NODE pool  specifc
  node_preemptible      = var.node_preemptible  
  node_pool_name        = format("main-pool-%s", local.tfenvironment)
  gke_pool_node_count   = "1"
  gke_pool_image_type   = "COS"
  gke_pool_disk_size_gb = "100"
  gke_pool_disk_type    = "pd-standard"
  gke_pool_machine_type = var.gke_pool_machine_type
  node_config_timeout_create = "10m"
  node_config_timeout_delete = "10m"

}
