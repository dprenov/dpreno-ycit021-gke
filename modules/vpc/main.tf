terraform {
  required_version = ">= 0.12"
}

locals {
  # Local VPC and Subnet names
  vpc_name        = format("vpc-%s-%s-%s", var.org, var.product, var.environment)
  subnet_name     = format("subnet-%s-%s-%s", var.org, var.product, var.environment)
  cloud_nat_name  = format("cloud-nat-%s-%s-%s", var.org, var.product, var.environment)
  firewall_name   = format("allow-tcp-ssh-icmp-%s-%s-%s", var.org, var.product, var.environment)
  net_reouter_name =format("net-router-%s-%s-%s", var.org, var.product, var.environment)
  project_id    = var.gcp_project_id
}


#VPC

resource "google_compute_network" "vpc_network" {
  name                    = local.vpc_name 
  routing_mode            = var.routing_mode     #"REGIONAL"
  description             = var.description      #"VPC that will be used by the GKE private cluster on the related project"
  auto_create_subnetworks = var.auto_create_subnetworks #false
}

#Subnet

resource "google_compute_subnetwork" "gke_private_subnet" {
  name                     = local.subnet_name  
  network                  = google_compute_network.vpc_network.self_link
  region                   = var.gcp_region
  project                  = local.project_id  #var.gcp_project_id
  ip_cidr_range            = var.network_cidr
  private_ip_google_access = var.private_ip_google_access                #true
  log_config {
    aggregation_interval = var.subnet_log_config_aggregation_interval    #"INTERVAL_15_MIN"
    flow_sampling        = var.subnet_log_config_flow_sampling           #0.1
    metadata             = var.subnet_log_config_metadata                #"INCLUDE_ALL_METADATA"
  }
  secondary_ip_range {
    range_name    = var.pods_cidr_name
    ip_cidr_range = var.pods_cidr
  }
  secondary_ip_range {
    range_name    = var.services_cidr_name
    ip_cidr_range = var.services_cidr
  }
}

#CLOUD NAT
resource "google_compute_router_nat" "gke_cloud_nat" {
  project                = local.project_id 
  name                   = local.cloud_nat_name                         # "gke-cloud-nat"
  router                 = google_compute_router.gke_net_router.name
  region                 = var.gcp_region
  nat_ip_allocate_option = var.nat_ip_allocate_option                   # "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = var.nat_source_subnetwork_ip_ranges_to_nat     #"ALL_SUBNETWORKS_ALL_IP_RANGES"
  log_config {
    filter = var.nat_log_config_filter                                  #"ALL"
    enable = var.nat_log_config_enable                                  #true
  }
}
# FIREWALL
resource "google_compute_firewall" "ssh-rule" {
  name =  local.firewall_name 
  network = google_compute_network.vpc_network.self_link
  allow {
    protocol = "tcp"
    ports = ["22"]
  }
  allow {
    protocol = "icmp"
  }
}

# ROUTER
resource "google_compute_router" "gke_net_router" {
  project = local.project_id 
  name    = local.net_reouter_name            # "gke-net-router"
  region  = var.gcp_region
  network = google_compute_network.vpc_network.self_link
  bgp {
    asn = 64514
  }
}

/*
# GOOGLE CLOUD SERVICES
resource "google_project_service" "compute" {
  service = "compute.googleapis.com"
  disable_on_destroy = false
}
resource "google_project_service" "gke_api" {
  service = "container.googleapis.com"
  disable_on_destroy = false
}
*/

 