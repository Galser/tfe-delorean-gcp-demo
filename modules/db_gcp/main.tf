# Postgres GCP (CloudSQL) module code
# Password
resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "_-"
}

// let's ensure that DB name is up on
// good standards
locals {
  db_name = join("", regexall("\\w+", var.name))
}

resource "google_sql_database_instance" "tfemaster" {
  name             = local.db_name
  database_version = "POSTGRES_9_6"
  region           = var.region
  deletion_protection = false

  settings {
    # Second-generation instance tiers are based on the machine
    # type. See argument reference below.
    disk_size = 50
    tier      = "db-f1-micro" # or ? "db-g1-small"
    ip_configuration {
      ipv4_enabled = true
      authorized_networks {
        name  = "all"
        value = "0.0.0.0/0"
      }
    }
  }
}

resource "google_sql_database" "tfedatabase" {
  name     = local.db_name
  instance = google_sql_database_instance.tfemaster.name
}

resource "google_sql_user" "tfeadmin" {
  name     = var.username
  instance = google_sql_database_instance.tfemaster.name
  password = random_password.password.result
}


/* 
#Part below not required for new TF

provider "postgresql" {
  host     = "${google_sql_database_instance.tfemaster.public_ip_address}"
  username = "${google_sql_user.tfeadmin.name}"
  password = "${google_sql_user.tfeadmin.password}"
}

resource "postgresql_schema" "schemas" {
  count = length(var.db_schemas)
  name  = var.db_schemas[count.index]
  #owner = var.username
}

resource "postgresql_extension" "my_extension" {
  for_each = var.db_extensions_map
  name     = each.key
  schema   = each.value
}
*/

# Not safe output for debug only
/* resource "null_resource" "timed-pw-out" {
  triggers = {
    timey = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "echo DB creds user ${var.name}, pw ${random_password.password.result}"
  }
} */