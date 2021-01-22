module "compute_gcp" {
  source = "./modules/compute_gcp/"
  name = var.tfe_name
  availabilityZone = var.availabilityZone
  key_path = var.key_path
  public_key_path = var.public_key_path
	network = module.network_gcp.network.name
	subnetwork = module.network_gcp.network.subnet
  replicated_config = module.config.replicated_config
  tfe_config = module.config.tfe_config
  cloudinit = module.config.cloudinit
//	subnetwork = "tfe-aa-subnet"
}

output "compute_gcp" {
  value = module.compute_gcp
}
