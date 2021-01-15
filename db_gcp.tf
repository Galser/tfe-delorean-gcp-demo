module "db_gcp" {
  source = "./modules/db_gcp/"
  name = var.tfe_name
  username = var.db_admin
  region = var.region
}

output "db_gcp" {
  value = module.db_gcp.postgres_config
}
