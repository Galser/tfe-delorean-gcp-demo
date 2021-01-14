module "compute_instance_group" {
  source = "./modules/compute_instance_group/"
}

output "compute_instance_group" {
  value = module.compute_instance_group
}
