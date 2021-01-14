# Redis GCP module OUTPUTS
output "host" {
  value = google_redis_instance.redis_gcp.host
}

output "port" {
  value = google_redis_instance.redis_gcp.port
}
