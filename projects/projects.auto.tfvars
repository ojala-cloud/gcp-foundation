#
# GCP Foundation
#

#
# Folder structure
#

existing_folders = [
]
folders = [
  "heroku",
]

#
# Shared VPC Hosts
#

shared_vpc_projects = {
  common-shared-vpc = "ojala-network-hub-e0c7"
}

#
# Projects
#

projects = {
  #
  # Simple development project in heroku folder
  # - access to dev subnet in Shared VPC
  #
  dev-project = {
    name              = "Demo DEV project"
    id                = "ojala-heroku-dev"
    random_project_id = true
    folder            = "heroku"
    labels = {
      "environment" = "dev",
    }
    #
    # Shared VPC access
    #
    shared_vpcs = {
      project = "common-shared-vpc"
      subnets = [
        {
          region = "europe-north1"
          subnet = "heroku-dev"
        },
      ]
    }
  }
  #
  # Simple production project in heroku folder
  # - access to prod subnet in Shared VPC
  #
  prod-project = {
    name              = "Demo PROD project"
    id                = "ojala-heroku-prod"
    random_project_id = true
    folder            = "heroku"
    shared_vpcs = {
      project = "common-shared-vpc"
      subnets = [
        {
          region = "europe-north1"
          subnet = "heroku-prod"
        },
      ]
    }
    labels = {
      "environment" = "prod",
    }
  }
  #
  # Simple sandbox project in heroku folder without Shared VPC access
  #
  sandbox-project = {
    name              = "Demo SANDBOX project"
    id                = "ojala-heroku-sandbox"
    random_project_id = true
    folder            = "heroku"
    labels = {
      "environment" = "sandbox",
    }
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
]

default_project_labels = {
  "application" = "heroku"
}
