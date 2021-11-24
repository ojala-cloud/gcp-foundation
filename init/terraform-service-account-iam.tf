#
# Permissions for Terraform Service Accounts

locals {
  organization_roles = distinct(flatten([
    for section_name, section in var.section : [
      for role in section.organization_roles == null ? [] : section.organization_roles : {
        index   = join("_", [section_name, role])
        section = section_name
        role    = role
      }
    ]
  ]))

  folder_roles = distinct(flatten([
    for section_name, section in var.section : [
      for folder, roles in section.folder_roles == null ? {} : section.folder_roles : [
        for role in roles : {
          index   = join("_", [section_name, folder, role])
          section = section_name
          folder  = folder
          role    = role
        }
      ]
    ]
  ]))

  project_roles = distinct(flatten([
    for section_name, section in var.section : [
      for project, roles in section.project_roles == null ? {} : section.project_roles : [
        for role in roles : {
          index   = join("_", [section_name, project, role])
          section = section_name
          project = project
          role    = role
        }
      ]
    ]
  ]))
}

#
# Roles to the Organization
#

resource "google_organization_iam_member" "terraform" {
  provider = google-beta

  for_each = {
    for v in local.organization_roles : v.index => v
  }

  org_id = var.gcp_organization_id
  role   = each.value.role
  member = "serviceAccount:${google_service_account.terraform[each.value.section].email}"
}

#
# Roles to Folders
#

resource "google_folder_iam_member" "terraform" {
  provider = google-beta

  for_each = {
    for v in local.folder_roles : v.index => v
  }

  folder = lookup(lookup(local.folder_structure, each.value.folder, {}), "id", null)
  role   = each.value.role
  member = "serviceAccount:${google_service_account.terraform[each.value.section].email}"
}

#
# Roles to Projects
#

resource "google_project_iam_member" "terraform" {
  provider = google-beta

  for_each = {
    for v in local.project_roles : v.index => v
  }

  project = each.value.project
  role    = each.value.role
  member  = "serviceAccount:${google_service_account.terraform[each.value.section].email}"
}
