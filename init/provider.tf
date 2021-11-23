#
# Providers
#

provider "google" {
  project = var.gcp_default_terraform_project
  region  = var.gcp_default_region
}

provider "google-beta" {
  project = var.gcp_default_terraform_project
  region  = var.gcp_default_region
}
