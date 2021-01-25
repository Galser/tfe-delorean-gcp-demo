# Network : DNS CloudFlare
module "dns_cloudflare" {
  source = "./modules/dns_cloudflare"

  host   = var.tfe_name
  domain = var.site_domain
  #  cname_target = module.lb_aws.fqdn
  frontend_ip = module.lb_gcp.lb_ip

  backend_ip = module.compute_gcp.instance_data.public_ip
}