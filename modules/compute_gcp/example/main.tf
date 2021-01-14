module "compute_gcp" {
  source = "../"
}

output "compute_gcp" {
  value = module.compute_gcp
}
