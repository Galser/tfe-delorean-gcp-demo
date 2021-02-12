resource "google_compute_url_map" "tfe" {
  name        = "${var.name}-urlmap"
  description = "tfe"

  default_service = google_compute_backend_service.primary.self_link

}


// Dashboard not used - disabled in Activee-A
resource "google_compute_backend_service" "primary" {
  name        = "${var.name}-primary-backend"
  port_name   = "https" // Should be in sync with instance template name
  protocol    = "HTTPS"
  timeout_sec = 60

  health_checks = [google_compute_health_check.primary.self_link]

  backend {
    description = "primary servers"
    group       = var.instance_group
  }
}

resource "google_compute_health_check" "primary" {
  name               = "${var.name}-primary-healthcheck"
  check_interval_sec = 5
  timeout_sec        = 4

  https_health_check {
    request_path = "/_health_check"
    port         = 443
  }
}