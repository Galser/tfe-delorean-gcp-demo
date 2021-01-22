module "db_gcp" {
  source = "./modules/db_gcp/"
  name = var.tfe_name
  username = var.db_admin
  region = var.region
  network_id = module.network_gcp.network.id
}

output "db_gcp" {
  value = module.db_gcp.postgres_config
}
