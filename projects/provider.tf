#
# Providers
#

provider "google" {
  region = var.gcp_default_region
}

provider "google-beta" {
  region = var.gcp_default_region
}
