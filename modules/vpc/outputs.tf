/*
output "Project_id" {
  value = google_project.project.project_id
  description = "GCP project ID"
}
*/
/*
output "Project_number" {
  value = google_project.project.number
  description = "GCP project number"
  sensitive = true
}
*/

output "vpc_name" {
  value = google_compute_network.vpc_network.name
}
output "vpc_selflink" {
  value = "${google_compute_network.vpc_network.self_link}"
}

output "vpc_network_selflink" {
  value = "google_compute_network.vpc_network.self_link"
}

output "subnet_selflink" {
  value = "${google_compute_subnetwork.gke_private_subnet.self_link}"
}
output "subnet_id" {
  value = "${google_compute_subnetwork.gke_private_subnet.id}"
}
