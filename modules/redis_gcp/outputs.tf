# Redis GCP module OUTPUTS
output "redis_config" {
 value = {
  host = google_redis_instance.redis_gcp.host
  port = google_redis_instance.redis_gcp.port
 }
}
