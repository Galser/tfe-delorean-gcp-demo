module "compute_instance_group" {
  source = "../"
}

output "compute_instance_group" {
  value = module.compute_instance_group
}
