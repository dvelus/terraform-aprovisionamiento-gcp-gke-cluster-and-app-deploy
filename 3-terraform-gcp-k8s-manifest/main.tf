module "gcp-project" {
  # source = "git::<http-route-to-git-repo.git>//<dir>"
  source          = "../1-terraform-gcp-project"
  sandbox_id      = var.sandbox_id
  organization_id = var.organization_id
  billing_account = var.billing_account
  project_apis    = var.project_apis
}

module "gcp-gke" {
  # source = "git::<http-route-to-git-repo.git>//<dir>"
  source                 = "../2-terraform-gcp-gke"
  sandbox_id             = var.sandbox_id
  project_id             = module.gcp-project.project_id
  project_location       = var.project_location
  project_cluster_config = var.project_cluster_config
}

resource "kubectl_manifest" "test" {
  for_each = {
    db-deployment     = "k8s-specifications/db-deployment.yaml"
    db-service        = "k8s-specifications/db-service.yaml"
    redis-deployment  = "k8s-specifications/redis-deployment.yaml"
    redis-service     = "k8s-specifications/redis-service.yaml"
    result-deployment = "k8s-specifications/result-deployment.yaml"
    result-service    = "k8s-specifications/result-service.yaml"
    vote-deployment   = "k8s-specifications/vote-deployment.yaml"
    vote-service      = "k8s-specifications/vote-service.yaml"
    worker-deployment = "k8s-specifications/worker-deployment.yaml"
  }
  yaml_body = file("${path.module}/${each.value}")
}