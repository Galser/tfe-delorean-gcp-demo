output "network" {
  value = {
    name         = google_compute_network.tfe_vpc.name
    subnet_range = google_compute_subnetwork.tfe_subnet.ip_cidr_range
    id           = google_compute_network.tfe_vpc.id
    //subnet       = google_compute_subnetwork.tfe_subnet.name
    subnet = google_compute_subnetwork.tfe_subnet.self_link
  }
}

