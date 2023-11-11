variable "sandbox_id" {
  default = ""
}

variable "organization_id" {
  default = "24851311546"
}

variable "billing_account" {
  default = "014413-D964D8-7A33D2"
}

variable "project_apis" {
  default = [
    "compute.googleapis.com",
    "container.googleapis.com",
    "certificatemanager.googleapis.com"
  ]
}
