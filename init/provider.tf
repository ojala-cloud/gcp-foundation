#
# Providers
#

provider "google" {
  project = var.gcp_default_terraform_project
  region  = var.gcp_default_region
}
