# dns_cloudflare outputs
output "backend_fqdn" {
  value = "${local.backend}.${var.domain}"
}