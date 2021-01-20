module "compute_instance_group" {
  source = "./modules/compute_instance_group/"
  name = var.tfe_name
  availabilityZone = var.availabilityZone
  instances        = [module.compute_gcp.instance_data.link]
}

output "compute_instance_group" {
  value = module.compute_instance_group
}
