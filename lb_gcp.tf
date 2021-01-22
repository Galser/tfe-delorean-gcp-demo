# Network : LB
# Certificate : Upload into GCP
resource "google_compute_ssl_certificate" "tfe" {
  name_prefix = "${var.tfe_name}-tfe-"
  description = "TFE LB cert"
  private_key = module.sslcert_letsencrypt.cert_private_key_pem
  certificate = module.sslcert_letsencrypt.cert_pem

  lifecycle {
    create_before_destroy = true
  }
}


module "lb_gcp" {
  source           = "./modules/lb_gcp"
  name             = var.tfe_name
  instance_group   = module.compute_instance_group.link
  project          = var.project
  ssl_certificates = [google_compute_ssl_certificate.tfe.self_link]
  // ! list ^^^
  tfe_name    = var.tfe_name
  site_domain = var.site_domain
  tags        = { "app" : "tfe" }
}

output "lb_gcp" {
  value = module.lb_gcp
}
