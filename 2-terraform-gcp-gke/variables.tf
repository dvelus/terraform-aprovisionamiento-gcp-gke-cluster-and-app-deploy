variable "sandbox_id" {
  #env variable
  default = ""
}

variable "project_id" {
  # required to add project_id output after create gcp-project
  default = ""
}

variable "project_location" {
  default = "us-central1"
}

variable "project_cluster_config" {
  default = {
    deletion_protection      = false
    remove_default_node_pool = false
    initial_node_count       = 1
    gateway_api_config = {
      channel = "CHANNEL_STANDARD"
    }
    node_config = {
      machine_type = "e2-standard-2"
      disk_size_gb = 50
    }
  }
}
