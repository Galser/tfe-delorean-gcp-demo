output "compute_gcp" {
  value = {
    link         = google_compute_instance.ptfe.self_link
    id           = google_compute_instance.ptfe.id
    punblic_ip   = google_compute_instance.ptfe.network_interface.0.access_config.0.nat_ip
  }
}
 
