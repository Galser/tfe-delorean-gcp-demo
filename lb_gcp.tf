module "lb_gcp" {
  source = "./modules/lb_gcp/"
}

output "lb_gcp" {
  value = module.lb_gcp
}
