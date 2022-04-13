# Postgres GCP (CloudSQL) module code
# Password
resource "random_password" "password" {
  length           = 18
  special          = true
  override_special = "_-"
}

resource "random_pet" "dbname_suffix" {
  length = 2
}
// let's ensure that DB name is up on
// good standards
locals {
  db_name = "${join("", regexall("\\w+", var.name))}-${random_pet.dbname_suffix.id}"
}


/* resource "google_compute_global_address" "private_ip_block" {
  provider = google-beta

  name          = "${var.name}-private-ip-address"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = var.network_id
}

resource "google_service_networking_connection" "private_vpc_connection" {
  provider = google-beta

  network                 = var.network_id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_block.name]
} */


resource "google_compute_global_address" "private_ip_address" {
  provider = google-beta

  name          = "${var.name}-private-ip-address"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 24
  network       = var.network_id
}

resource "google_service_networking_connection" "private_vpc_connection" {
  provider = google-beta

  network                 = var.network_id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
}


resource "google_sql_database_instance" "tfemaster" {
  provider            = google-beta
  name                = local.db_name
  database_version    = "POSTGRES_9_6"
  region              = var.region
  deletion_protection = false

  depends_on = [google_service_networking_connection.private_vpc_connection]


  settings {
    # Second-generation instance tiers are based on the machine
    # type. See argument reference below.
    disk_size         = 50
#    tier              = "db-f1-micro" # or ? "db-g1-small"
    tier              = var.tier # "db-custom-2-7680" # or ? "db-g1-small"
    availability_type = "REGIONAL"
    ip_configuration {
      ipv4_enabled    = false
      private_network = var.network_id
      authorized_networks {
        name  = "all"
        value = "0.0.0.0/0"
      }
    }
  }


}

resource "google_sql_database" "tfedatabase" {
  provider = google-beta
  name     = local.db_name
  instance = google_sql_database_instance.tfemaster.name
}

resource "google_sql_user" "tfeadmin" {
  provider = google-beta
  name     = var.username
  instance = google_sql_database_instance.tfemaster.name
  password = random_password.password.result
}
