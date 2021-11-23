#
# Service Accounts for GCP Foundation Terraform
#

resource "google_service_account" "terraform" {
  for_each = var.section

  account_id   = "sa-terraform-${each.key}"
  display_name = each.value.name == null ? "Terraform CI/CD Service Account" : "Terraform ${each.value.name} Service Account"
}

resource "time_rotating" "terraform" {
  rotation_days = 30
}

resource "google_service_account_key" "terraform" {
  for_each = var.section

  service_account_id = google_service_account.terraform[each.key].name

  keepers = {
    rotation_time = time_rotating.terraform.rotation_rfc3339
  }
}
