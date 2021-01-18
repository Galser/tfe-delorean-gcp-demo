# Objectstorage (GCP) module output
output "object_storage_config" {
  value = {
    bucket      = google_storage_bucket.tfe.name
    project     = google_storage_bucket.tfe.project
    credentials = base64decode(google_service_account_key.tfe_bucket.private_key)
  }
}