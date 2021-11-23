#
# Permissions for Terraform Service Account
#
# network
#

locals {
  network_service_account = google_service_account.terraform["network"].email

  network_organization_roles = [
    "roles/compute.networkAdmin"
  ]
  network_project_roles = {
    "shared-vpc-329414" = [
      "roles/compute.networkAdmin"
    ],
  }
}

#
# Permissions to the Organization
#

resource "google_organization_iam_member" "network_service_account" {
  for_each = toset(local.network_organization_roles)

  org_id = var.gcp_organization_id
  role   = each.value
  member = "serviceAccount:${local.network_service_account}"
}

#
# Permissions to Projects
#

locals {
  #
  # Build an array of objects for each role to assign, object contains
  # index for Terraform resource index name, project and role
  #
  network_all_roles = flatten([
    for project, permissions in local.network_project_roles : [
      for role in permissions : {
        index   = join("_", [project, role])
        project = project
        role    = role
      }
    ]
  ])
}

resource "google_project_iam_member" "network_service_account" {
  for_each = {
    for p in local.network_all_roles : p.index => p
  }

  project = each.value.project
  role    = each.value.role
  member  = "serviceAccount:${local.network_service_account}"
}
