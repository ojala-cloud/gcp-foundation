#
# Folder structure
#
# Support for both existing folders and folders that are managed by this code
#

locals {
  folder_structure = merge(
    {
      for i, f in data.google_folder.existing : i => f
    },
    {
      for i, f in google_folder.common_projects : i => f
    },
  )
}

#
# Existing folders
#

data "google_folder" "existing" {
  for_each = toset(var.existing_folders)

  folder              = "folders/${each.key}"
  lookup_organization = false
}

#
# New folders
#

resource "google_folder" "common_projects" {
  for_each = toset(var.folders)

  display_name = each.key
  parent       = "organizations/${var.gcp_organization_id}"
}
