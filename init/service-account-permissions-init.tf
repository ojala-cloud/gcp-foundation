#
# Permissions for Terraform Service Account
#
# init
#

locals {
  init_service_account = google_service_account.terraform["init"].email

  init_organization_roles = [
    "roles/owner"
  ]
  init_project_roles = {
    "shared-vpc-329414" = [
      "roles/owner"
    ],
    "home-infrastructure-254608" = [
      "roles/compute.networkAdmin"
    ]
  }
}

#
# Permissions to the Organization
#

resource "google_organization_iam_member" "init_service_account" {
  for_each = toset(local.init_organization_roles)

  org_id = var.gcp_organization_id
  role   = each.value
  member = "serviceAccount:${local.init_service_account}"
}

#
# Permissions to Projects
#

locals {
  #
  # Build an array of objects for each role to assign, object contains
  # index for Terraform resource index name, project and role
  #
  init_all_roles = flatten([
    for project, permissions in local.init_project_roles : [
      for role in permissions : {
        index   = join("_", [project, role])
        project = project
        role    = role
      }
    ]
  ])
}

resource "google_project_iam_member" "init_service_account" {
  for_each = {
    for p in local.init_all_roles : p.index => p
  }

  project = each.value.project
  role    = each.value.role
  member  = "serviceAccount:${local.init_service_account}"
}
