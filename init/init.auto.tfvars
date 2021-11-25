#
# GCP Foundation
#

#
# Workflows and Templates
#

section = {
  init = {
    name             = "GCP Foundation (bootstrap)"
    description      = "Foundation core"
    google_credentials = "$${{ secrets.GOOGLE_CREDENTIALS_INIT }}"
    workflow_enabled = true
    organization_roles = [
      "roles/iam.serviceAccountAdmin",
      "roles/resourcemanager.organizationAdmin",
      "roles/resourcemanager.folderCreator",
      "roles/iam.serviceAccountKeyAdmin",
    ]
  }
  common-projects = {
    name               = "GCP Common Projects"
    description        = "Common projects for the GCP Organization"
    google_credentials = "$${{ secrets.GOOGLE_CREDENTIALS_COMMON_PROJECTS }}"
    organization_roles = [
      "roles/resourcemanager.projectCreator",
      "roles/resourcemanager.folderCreator",
      "roles/resourcemanager.organizationAdmin",
      "roles/billing.user",
      # To be able to create Shared VPC in the project
      "roles/compute.xpnAdmin",
    ]
  }
  organization = {
    name               = "GCP Organization"
    description        = "GCP Organization settings, policies and logging"
    google_credentials = "$${{ secrets.GOOGLE_CREDENTIALS_ORGANIZATION }}"
    organization_roles = [
      "roles/resourcemanager.organizationAdmin",
      "roles/resourcemanager.folderViewer",
      "roles/resourcemanager.folderIamAdmin",
      "roles/orgpolicy.policyAdmin",
    ]
  }
  network = {
    name               = "GCP Common networking"
    description        = "Common network infrastructure, Shared VPCs and connectivity"
    google_credentials = "$${{ secrets.GOOGLE_CREDENTIALS_NETWORK }}"
    organization_roles = [
      "roles/compute.networkAdmin",
      "roles/compute.xpnAdmin",
    ]
    project_roles = {
      "ojala-network-hub-e0c7" = [
        "roles/compute.networkAdmin",
      ],
    }
  }
  projects = {
    name               = "GCP Project Factory"
    description        = "Folder and Project Factory"
    google_credentials = "$${{ secrets.GOOGLE_CREDENTIALS_PROJECTS }}"
    organization_roles = [
      "roles/resourcemanager.folderCreator",
      "roles/resourcemanager.projectCreator",
      "roles/billing.user",
      "roles/compute.xpnAdmin",
    ]
    project_roles = {
      "ojala-network-hub-e0c7" = [
        "roles/compute.networkAdmin",
      ],
    }
  }
}

#
# Development defaults
#

gcp_default_terraform_project = "home-infrastructure-254608"
gcp_default_region            = "europe-north1"
gcp_organization_id           = "237024123207"
common_prefix                 = "pojala-"
