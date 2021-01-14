module "dns_cloudflare" {
  source = "../"
}

output "dns_cloudflare" {
  value = module.dns_cloudflare
}
