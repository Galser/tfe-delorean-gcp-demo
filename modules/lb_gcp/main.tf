# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# This module deploys a HTTP(S) Cloud Load Balancer on GCP
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
terraform {
  required_version = ">= 0.12"
}

resource "google_compute_global_address" "default" {
  project      = var.project
  name         = "${var.name}-address"
  ip_version   = "IPV4"
  address_type = "EXTERNAL"
}

resource "google_compute_global_forwarding_rule" "https" {
  name       = "${var.name}-https"
  ip_address = google_compute_global_address.default.address
  target     = google_compute_target_https_proxy.tfe.self_link
  port_range = "443"

  depends_on = [google_compute_global_address.default]

  load_balancing_scheme = "EXTERNAL"
}

resource "google_compute_target_https_proxy" "tfe" {
  name             = "${var.name}-https-proxy"
  url_map          = google_compute_url_map.tfe.self_link
  ssl_certificates = var.ssl_certificates
  #ssl_policy       = var.sslpolicy
}

/* resource "google_compute_global_forwarding_rule" "replicated-https" {
  name       = "${var.name}-replciated-dashboard-https"
  ip_address = google_compute_global_address.default.address
  target     = google_compute_target_https_proxy.tfe.self_link
  port_range = "443"

  depends_on = [google_compute_global_address.default]

  load_balancing_scheme = "EXTERNAL"
}
*/