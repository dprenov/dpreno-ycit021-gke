
output "id" {
  value = "${google_container_cluster.primary_cluster.id}"
  description = "The ID of the cluster created."
}
output "endpoint" {
  value = "${google_container_cluster.primary_cluster.endpoint}"
  description = "The cluster endpoint reference."
}
output "master_version" {
  value = "${google_container_cluster.primary_cluster.master_version}"
  description = "The master version of the cluster created."
}
