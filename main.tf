module "gcp-project" {
  # source = "git::<http-route-to-git-repo.git>//<dir>"
  source = "./1-terraform-gcp-project"
  sandbox_id = var.sandbox_id
  organization_id = var.organization_id
  billing_account = var.billing_account
  project_apis = var.project_apis
}

module "gcp-gke" {
  # source = "git::<http-route-to-git-repo.git>//<dir>"
  source = "./2-terraform-gcp-gke"
  sandbox_id = var.sandbox_id
  project_id = module.gcp-project.project_id
  project_location = var.project_location
  project_cluster_config = var.project_cluster_config
}