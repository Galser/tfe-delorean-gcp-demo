# Firewall (GCP) module code
resource "google_compute_firewall" "tfe" {
  name    = "${var.name}-firewall"
  network = var.network

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = concat(["22", "80", "443", "6379", "23010"], var.additional_firewall_ports)
    # do we need "6443"  and 6379? 

  }

  source_ranges = var.ip_allow_list
}

resource "google_compute_firewall" "tfe-vault" {
  name    = "${var.name}-firewall-vault"
  network = var.network

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["8200", "8201"] // transfered here from above
  }

  source_ranges = [var.subnet_range]
}

/*
# We may need this later for some automation

resource "google_compute_firewall" "lb-healthchecks" {
  name          = "${var.name}-lb-healthcheck-firewall"
  network       = google_compute_network.tfe_vpc.name
  source_ranges = concat([google_compute_subnetwork.tfe_subnet.ip_cidr_range], var.healthcheck_ips)

  allow {
    protocol = "tcp"
  }
}
*/