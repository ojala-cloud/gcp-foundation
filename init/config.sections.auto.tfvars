#
# Workflows and Templates
#

section = {
  init = {
    #
    # Init (Bootstrap) code to deploy GitHub Action Workflows, Terraform Service Accounts and State storage for Terraform
    #
    name               = "GCP Foundation (bootstrap)"
    description        = "Foundation core"
    google_credentials = "$${{ secrets.GOOGLE_CREDENTIALS_INIT }}"
    workflow_enabled   = true
    organization_roles = [
      "roles/iam.serviceAccountAdmin",
      "roles/resourcemanager.organizationAdmin",
      "roles/resourcemanager.folderCreator",
      "roles/iam.serviceAccountKeyAdmin",
    ]
  }
  #
  # Shared Common projects for GCP Environments
  #
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
  #
  # Organization policies and other common resources for GCP Organization
  #
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
  #
  # Common Networking and Shared networking resources for GCP Organization
  #
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
  #
  # Project Factory for workload projects
  #
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
      ]
    }
  }
  #
  # One could add more sections here, e.g. for workload deployments
  #
}
