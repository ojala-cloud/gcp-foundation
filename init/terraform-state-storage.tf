#
# Storage bucket for Terraform states
#

resource "google_storage_bucket" "terraform" {
  for_each = var.section

  project                     = each.value.terraform_project == null ? var.gcp_default_terraform_project : each.value.terraform_project
  name                        = "${var.common_prefix}terraform-${each.key}"
  location                    = "EU"
  uniform_bucket_level_access = false

  versioning {
    enabled = true
  }
}

#
# Only Terraform Service Account is allowed to access the state bucket
#

resource "google_storage_bucket_iam_binding" "terraform" {
  for_each = var.section

  bucket = google_storage_bucket.terraform[each.key].name
  role   = "roles/storage.admin"
  members = [
    #
    # Init Terraform needs access to set IAM permissions
    #
    "serviceAccount:${google_service_account.terraform["init"].email}",
    #
    # Permissions for a particular workflow's Terraform Service Account
    #
    "serviceAccount:${google_service_account.terraform[each.key].email}",
  ]
}
