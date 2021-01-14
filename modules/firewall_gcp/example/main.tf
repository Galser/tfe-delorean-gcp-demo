module "firewall_gcp" {
  source = "../"
}

output "firewall_gcp" {
  value = module.firewall_gcp
}
