resource "google_compute_firewall" "default" {
  name    = "tfe-firewall"
  network = "default"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "443", "6379", "8200", "8201"]
    # do we need "6443" ? 
    
  }

  // source_tags = ["web"]
}
