
# variable "billing_account" {
#  description = "The billing account ID for this project"
#}

#variable "project_name" {
#  description = "The human readable project name (min 4 letters)"
#}

#variable "project_id" {
#  description = "The GCP project ID"
#}
 
variable "org" {
    type = string
    description= "Organization"
}
variable "product" {
    type = string
    description= "Product"
}
variable "environment" {
    type = string
    description= "Environment"
}

#variable "vpc_name" {
#    type = string
#    description = "VPC name"
#}


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
  description = "Automatically provision a default global VPC network"
  default     = false
}

variable "auto_create_subnetworks" {
    type = bool
    default = false
    description = "Enable Auto create sub networks"
}


variable "gcp_region" {
  type        = string
  description = "The GCP Region"
  default     = "us-central1"
}

variable "gcp_project_id" {
  type        = string
  description = "The newly created GCP project ID"
  default     = ""
}



# variables used to create VPC

variable "private_ip_google_access" {
  type        = bool
  description = "Either subnet will have access ip_google_access enabled or not"
  default     = true
}

variable "subnet_log_config_aggregation_interval" {
  type        = string
  description = "log aggregation interval to set-up"
  default     = "INTERVAL_15_MIN"
}

variable "subnet_log_config_flow_sampling" {
  type        = number
  description = "Log flow sampling option for the subnet"
  default     = 0.1
}

variable "subnet_log_config_metadata" {
  type        = string
  description = "log metadata option to set-up"
  default     = "INCLUDE_ALL_METADATA"
}

variable "network_cidr" {
  type        = string
  description = "CIDR IPv4 range for the network"
}

variable "pods_cidr" {
  type        = string
  description = "CIDR IPv4 range for the pods"
}

variable "pods_cidr_name" {
  type       = string
  description = "Name for the CIDR IPv4 range on the pods"
}

variable "services_cidr" {
  type        = string
  description = "CIDR IPv4 range for the services"
}

variable "services_cidr_name" {
  type = string
  description = "Name for the CIDR IPv4 range on for services"
}

# Cloud NAT
variable "nat_ip_allocate_option" {
  type        = string
  description = "IP allocation option for the Cloud NAT resource"
  default     = "AUTO_ONLY"
}

variable "nat_source_subnetwork_ip_ranges_to_nat" {
  type        = string
  description = "IP Range NAT mode"
  default     = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

variable "nat_log_config_filter" {
  type        = string
  description = "Filter to apply on the Cloud NAT log config"
  default     = "ALL"
}

variable "nat_log_config_enable" {
  type        = bool
  description = "Log config opeion for the Cloud NAT resource"
  default     = true
}

#Variables used to create Subnet

#variable "subnet_name" {
#    type = string
#    description = "Subnet name"
#}