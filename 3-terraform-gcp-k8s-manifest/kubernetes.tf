data "google_client_config" "provider" {
}

data "google_container_cluster" "my_cluster" {
  project    = module.gcp-project.project_id
  name       = module.gcp-gke.gke_name
  location   = var.project_location
  depends_on = [module.gcp-gke]
}

provider "kubernetes" {
  host  = "https://${data.google_container_cluster.my_cluster.endpoint}"
  token = data.google_client_config.provider.access_token
  cluster_ca_certificate = base64decode(
    data.google_container_cluster.my_cluster.master_auth[0].cluster_ca_certificate,
  )
}
provider "kubectl" {
  host = "https://${data.google_container_cluster.my_cluster.endpoint}"
  cluster_ca_certificate = base64decode(
    data.google_container_cluster.my_cluster.master_auth[0].cluster_ca_certificate,
  )
  token = data.google_client_config.provider.access_token
}