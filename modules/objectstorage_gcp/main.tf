# Objectstorage (GCP) module code

resource "random_pet" "bucket_name_suffix" {
  length = 2
}

resource "google_storage_bucket" "tfe" {
  name     = "${var.name}-${random_pet.bucket_name_suffix.id}"
  storage_class = "REGIONAL" // must be according
  location = var.location
}

