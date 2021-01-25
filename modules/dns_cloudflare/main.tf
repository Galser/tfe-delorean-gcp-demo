data "cloudflare_zones" "site_zone" {
  filter {
    name = var.domain
  }
}

locals {
  backend        = "${var.host}_backend"
  frontend       = "${var.host}.${var.domain}"
  domain_zone_id = lookup(data.cloudflare_zones.site_zone.zones[0], "id")
}

resource "cloudflare_record" "site_backend" {
  zone_id = local.domain_zone_id
  name    = local.backend
  value   = var.backend_ip
  type    = "A"
  ttl     = 600
}

resource "cloudflare_record" "site_lb" {
  zone_id = local.domain_zone_id
  name    = local.frontend
  value   = var.frontend_ip
  type    = "A"
  ttl     = 600
}
