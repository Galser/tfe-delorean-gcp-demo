# Network module code

resource "google_compute_network" "tfe_vpc" {
  name                    = "${var.name}-vpc"
  description             = "Terraform Enterprise VPC Network"
  auto_create_subnetworks = false
}


resource "google_compute_subnetwork" "tfe_subnet" {
  name          = "${var.name}-subnet"
  ip_cidr_range = var.subnet_range
  region        = var.region
  network       = google_compute_network.tfe_vpc.self_link
}

resource "google_compute_router" "tfe_router" {
  name    = "${var.name}-router"
  region  = var.region
  network = google_compute_network.tfe_vpc.self_link
}

resource "google_compute_router_nat" "nat" {
  name                               = "${var.name}-router-nat"
  router                             = google_compute_router.tfe_router.name
  region                             = google_compute_router.tfe_router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}


/* resource "google_compute_global_address" "private_ip_block" {
  name         = "private-ip-block"
  purpose      = "VPC_PEERING"
  address_type = "INTERNAL"
  ip_version   = "IPV4"
  prefix_length = 20
  network       = google_compute_network.vpc.self_link
}
*/

# ---


