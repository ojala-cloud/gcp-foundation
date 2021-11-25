#
# Example code for terrascan and others
#

resource "google_storage_bucket" "user_error" {
  name                        = "bad-gcs-bucket"
  project                     = "home-infrastructure-254608"
  location                    = "EU"
  force_destroy               = true
  uniform_bucket_level_access = true
}

resource "google_storage_bucket_iam_binding" "user_error" {
  bucket = google_storage_bucket.user_error.name
  role   = "roles/storage.viewer"
  members = [
    "allUsers",
  ]
}
