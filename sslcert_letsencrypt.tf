# Certificate : SSL from Let'sEncrypt
module "sslcert_letsencrypt" {

  source = "./modules/sslcert_letsencrypt"

  host         = var.tfe_name
  domain       = var.site_domain
  dns_provider = "cloudflare"
}


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

output "sslcert_letsencrypt" {
  value = module.sslcert_letsencrypt
}
