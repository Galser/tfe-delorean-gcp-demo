module "network_gcp" {
  source = "./modules/network_gcp/"
  name = var.tfe_name
  region = var.region
}

output "network_gcp" {
  value = module.network_gcp
}
