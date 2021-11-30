#
# GCP Foundation
#

#
# Shared VPC Hosts
#

shared_vpc_projects = {
  common-shared-vpc = "ojala-network-hub-e0c7"
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

default_project_group_labels = {
  "heroku" = {
    "application" = "heroku"
  }
}
