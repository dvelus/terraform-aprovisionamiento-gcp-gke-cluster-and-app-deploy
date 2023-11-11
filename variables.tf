variable "sandbox_id" {
  #env variable
  default = ""
}

variable "organization_id" {
  default = "24851311546"
}

variable "billing_account" {
  default = "014413-D964D8-7A33D2"
}

variable "project_location" {
  default = "us-central1"
}

variable "project_apis" {
  default = [
    "compute.googleapis.com",
    "container.googleapis.com",
    "certificatemanager.googleapis.com"
  ]
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
