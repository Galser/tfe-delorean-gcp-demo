# Redis GCP module code
resource "google_redis_instance" "redis_gcp" {
  name           = var.name
  memory_size_gb = var.size
#  project        = var.project
}
