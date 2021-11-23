#
# Permissions for Terraform Service Account
#
# init
#

locals {
  projects_service_account = google_service_account.terraform["init"].email

  projects_organization_roles = [
    "roles/resourcemanager.projectCreator"
  ]
  projects_project_roles = {
  }
}

#
# Permissions to the Organization
#

resource "google_organization_iam_member" "projects_service_account" {
  for_each = toset(local.projects_organization_roles)

  org_id = var.gcp_organization_id
  role   = each.value
  member = "serviceAccount:${local.projects_service_account}"
}

#
# Permissions to Projects
#

locals {
  #
  # Build an array of objects for each role to assign, object contains
  # index for Terraform resource index name, project and role
  #
  projects_all_roles = flatten([
    for project, permissions in local.projects_project_roles : [
      for role in permissions : {
        index   = join("_", [project, role])
        project = project
        role    = role
      }
    ]
  ])
}

resource "google_project_iam_member" "projects_service_account" {
  for_each = {
    for p in local.projects_all_roles : p.index => p
  }

  project = each.value.project
  role    = each.value.role
  member  = "serviceAccount:${local.projects_service_account}"
}
