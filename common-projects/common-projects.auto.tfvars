#
# GCP Foundation
#

#
# Folder structure
#

existing_folders = [
]
folders = [
  "billing",
  "infrastructure",
]

#
# Common projects
#

projects = {
  #
  # Network hub for Shared VPCs and connectivity
  #
  network-hub = {
    name              = "Demo Network Hub"
    id                = "ojala-network-hub"
    random_project_id = true
    folder            = "infrastructure"
    apis = [
      "compute.googleapis.com",
      "dns.googleapis.com",
    ]
  }
  #
  # DNS Hub for shared DNS infrastructure and Cloud DNS
  #
  dns-hub = {
    name              = "Demo DNS Hub"
    id                = "ojala-dns-hub"
    random_project_id = true
    folder            = "infrastructure"
    apis = [
      "compute.googleapis.com",
      "dns.googleapis.com",
    ]
  }
}

#
# Development defaults
#

gcp_default_terraform_project = "home-infrastructure-254608"
gcp_default_region            = "europe-north1"
gcp_default_billing_account   = "01452E-21260E-0A2B3F"
gcp_organization_id           = "237024123207"
common_prefix                 = "pojala-"

default_apis = [
  "iam.googleapis.com",
  "storage-api.googleapis.com",
  "cloudresourcemanager.googleapis.com",
  "serviceusage.googleapis.com",
  "cloudbilling.googleapis.com",
  "orgpolicy.googleapis.com",
]

default_common_project_labels = {
  "demo" = "key"
}
