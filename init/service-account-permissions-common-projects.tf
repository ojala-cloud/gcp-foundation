#
# Permissions for Terraform Service Account
#
# common-projects
#

locals {
  common_projects_service_account = google_service_account.terraform["common-projects"].email

  common_projects_organization_roles = [
    "roles/resourcemanager.projectCreator",
    "roles/resourcemanager.folderCreator",
    "roles/billing.user",
    # To be able to create Shared VPC in the project
    "roles/compute.xpnAdmin",
  ]
  common_projects_project_roles = {
  }
}

#
# Permissions to the Organization
#

resource "google_organization_iam_member" "common_projects_service_account" {
  for_each = toset(local.common_projects_organization_roles)

  org_id = var.gcp_organization_id
  role   = each.value
  member = "serviceAccount:${local.common_projects_service_account}"
}

#
# Permissions to Projects
#

locals {
  #
  # Build an array of objects for each role to assign, object contains
  # index for Terraform resource index name, project and role
  #
  common_projects_all_roles = flatten([
    for project, permissions in local.common_projects_project_roles : [
      for role in permissions : {
        index   = join("_", [project, role])
        project = project
        role    = role
      }
    ]
  ])
}

resource "google_project_iam_member" "common_projects_service_account" {
  for_each = {
    for p in local.common_projects_all_roles : p.index => p
  }

  project = each.value.project
  role    = each.value.role
  member  = "serviceAccount:${local.common_projects_service_account}"
}
