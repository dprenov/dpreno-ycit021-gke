terraform {
  required_version = ">= 0.12"
}

locals {
  # Local GKE 
  gke_name              = format("gke-%s-%s-%s", var.org, var.product, var.environment)
  project_id            = var.gcp_project_id
  vpc_network_self_link = var.vpc_network
  subnet_self_link      = var.subnet_selflink
}

#GKE CLUSTER
resource "google_container_cluster" "primary_cluster" {
  provider                = google-beta

  project                 = local.project_id                       #var.gcp_project_id

  name                    = local.gke_name  
  min_master_version      = var.kubernetes_version
  network                 = local.vpc_network_self_link            # network  = google_compute_network.vpc_network.self_link
  subnetwork              = local.subnet_self_link                 # subnetwork = google_compute_subnetwork.gke_private_subnet.self_link
  location                = var.gcp_region
  logging_service         = var.logging_service
  monitoring_service      = var.monitoring_service

  remove_default_node_pool= var.remove_default_node_pool
  initial_node_count      = var.initial_node_count

  private_cluster_config {
    enable_private_nodes   = var.enable_private_nodes
    enable_private_endpoint= var.enable_private_endpoint
    master_ipv4_cidr_block = var.master_ipv4_cidr_block
  }

  network_policy {
    enabled  = var.network_policy
    provider = var.network_policy ? "CALICO" : "PROVIDER_UNSPECIFIED"
  }

  addons_config {
    http_load_balancing {
      disabled = var.disable_http_load_balancing
    }

    network_policy_config {
      disabled = var.network_policy ? false : true
    }

    horizontal_pod_autoscaling {
      disabled = var.disable_horizontal_pod_autoscaling
    }
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = var.pods_range_name
    services_secondary_range_name = var.services_range_name
  }

  maintenance_policy {
    daily_maintenance_window {
      start_time = var.maintenance_start_time
    }
  }

  timeouts {
    create = var.cluster_timeout_create                #"30m"
    update = var.cluster_timeout_update                #"30m"
    delete = var.cluster_timeout_delete                #"30m"
  }

  workload_identity_config {
    identity_namespace = "${local.project_id}.svc.id.goog"
  
  }
}

#Node Pool Resource
resource "google_container_node_pool" "custom-node_pool" {
  provider = google-beta
  
  name       = var.node_pool_name                                   #"main-pool"
  location   = var.gcp_region
  project    = local.project_id                                     #var.gcp_project_id
  cluster    = google_container_cluster.primary_cluster.name
  node_count = var.gke_pool_node_count
  version    = var.kubernetes_version

  management {
    auto_repair  = var.node_pool_management_auto_repair             #true
    auto_upgrade = var.node_pool_management_auto_upgrade            #true
  }
  node_config {
    preemptible  = var.node_preemptible                             #true
    image_type   = var.gke_pool_image_type
    disk_size_gb = var.gke_pool_disk_size_gb
    disk_type    = var.gke_pool_disk_type
    machine_type = var.gke_pool_machine_type
  }

  timeouts {
    create = var.node_config_timeout_create                         #"10m"
    delete = var.node_config_timeout_delete                         #"10m"
  }

  lifecycle {
    ignore_changes = [
      node_count
    ]
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

 