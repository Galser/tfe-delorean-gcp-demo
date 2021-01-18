# Network : GCP
# Network : Firewall
module "firewall_gcp" {
  source = "./modules/firewall_gcp"
	name = var.tfe_name
	network = module.network_gcp.network.name
	subnet_range =  module.network_gcp.network.subnet_range
}
