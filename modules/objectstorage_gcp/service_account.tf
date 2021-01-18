# Objectstorage (GCP) module code
# Service account part
resource "google_service_account" "tfe_bucket" {
  account_id   = "${var.name}-tfe-bucket"
  display_name = "To be used by Terraform Enterprise to authenticate with GCS Bucket."
  description  = "TFE to GCS Bucket auth."
}

resource "google_service_account_key" "tfe_bucket" {
  service_account_id = google_service_account.tfe_bucket.name
}

resource "google_storage_bucket_iam_member" "member-object" {
  bucket = google_storage_bucket.tfe.name
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${google_service_account.tfe_bucket.email}"
}

resource "google_storage_bucket_iam_member" "member-bucket" {
  bucket = google_storage_bucket.tfe.name
  role   = "roles/storage.legacyBucketReader"
  member = "serviceAccount:${google_service_account.tfe_bucket.email}"
}