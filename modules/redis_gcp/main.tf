# Redis GCP module code
resource "google_redis_instance" "redis_gcp" {
  name               = var.name
  memory_size_gb     = var.size
  authorized_network = var.network
	transit_encryption_mode = "SERVER_AUTHENTICATION"
  #  project        = var.project
}
