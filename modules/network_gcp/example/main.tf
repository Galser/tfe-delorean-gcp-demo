module "network_gcp" {
  source = "../"
}

output "network_gcp" {
  value = module.network_gcp
}
