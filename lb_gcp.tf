# Network : LB
module "lb_gcp" {
  source           = "./modules/lb_gcp"
  name             = var.tfe_name
  instance_group   = module.compute_instance_group.link
  project          = var.project
//  ssl_certificates = [google_compute_ssl_certificate.tfe.self_link]
  // ! list ^^^
  tfe_name    = var.tfe_name
  site_domain = var.site_domain
  tags        = { "app" : "tfe" }
}

output "lb_gcp" {
  value = module.lb_gcp
}
