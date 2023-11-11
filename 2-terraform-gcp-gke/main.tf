resource "google_container_cluster" "primary" {
  project  = var.project_id
  name     = "${var.sandbox_id}-cluster-v1"
  location = var.project_location

  deletion_protection      = var.project_cluster_config.deletion_protection
  remove_default_node_pool = var.project_cluster_config.remove_default_node_pool
  initial_node_count       = var.project_cluster_config.initial_node_count

  gateway_api_config {
    channel = var.project_cluster_config.gateway_api_config.channel
  }

  node_config {
    machine_type = var.project_cluster_config.node_config.machine_type
    disk_size_gb = var.project_cluster_config.node_config.disk_size_gb
  }
}

output "gke_name" {
  value = google_container_cluster.primary.name
}