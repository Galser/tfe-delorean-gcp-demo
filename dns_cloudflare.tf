module "dns_cloudflare" {
  source = "./modules/dns_cloudflare/"
}

output "dns_cloudflare" {
  value = module.dns_cloudflare
}
