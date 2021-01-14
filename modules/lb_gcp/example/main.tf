module "lb_gcp" {
  source = "../"
}

output "lb_gcp" {
  value = module.lb_gcp
}
