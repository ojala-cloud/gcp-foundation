#
# GCP Foundation
#

#
# Workflows and Templates
#

section = {
  init = {
    name             = "Terraform Foundation"
    description      = "Foundation core"
    workflow_enabled = false
  }
  common-projects = {
    name               = "GCP Common Projects"
    description        = "Common projects for the GCP Organization"
    google_credentials = "$${{ secrets.GOOGLE_CREDENTIALS_COMMON_PROJECTS }}"
  }
  organization = {
    name        = "GCP Organization"
    description = "GCP Organization settings, policies and logging"
  }
  network = {
    name        = "GCP Common networking"
    description = "Common network infrastructure, Shared VPCs and connectivity"
  }
  projects = {
    name        = "GCP Project Factory"
    description = "Folder and Project Factory"
  }
}

#
# Development defaults
#

gcp_default_terraform_project = "home-infrastructure-254608"
gcp_default_region            = "europe-north1"
gcp_organization_id           = "237024123207"
common_prefix                 = "pojala-"
