module "sslcert_letsencrypt" {
  source = "../"
}

output "sslcert_letsencrypt" {
  value = module.sslcert_letsencrypt
}
