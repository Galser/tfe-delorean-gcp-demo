module "sslcert_letsencrypt" {
  source = "./modules/sslcert_letsencrypt/"
}

output "sslcert_letsencrypt" {
  value = module.sslcert_letsencrypt
}
