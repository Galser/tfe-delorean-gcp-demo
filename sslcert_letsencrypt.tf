# Certificate : SSL from Let'sEncrypt
module "sslcert_letsencrypt" {

  source = "./modules/sslcert_letsencrypt"

  host         = var.tfe_name
  domain       = var.site_domain
  dns_provider = "cloudflare"
}

output "sslcert_letsencrypt" {
  value = module.sslcert_letsencrypt
}
