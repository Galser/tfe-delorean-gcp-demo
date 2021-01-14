module "compute_gcp" {
  source = "./modules/compute_gcp/"
}

output "compute_gcp" {
  value = module.compute_gcp
}
