resource "tls_private_key" "private_key" {
  algorithm = "RSA"
}

resource "acme_registration" "reg" {
  account_key_pem = tls_private_key.private_key.private_key_pem
  email_address   = "andrii@${var.domain}"
}

resource "acme_certificate" "certificate" {
  account_key_pem = acme_registration.reg.account_key_pem
  common_name     = "${var.host}.${var.domain}"

  dns_challenge {
    provider = var.dns_provider
  }
}

locals {
  cert_bundle = <<EOT
${acme_certificate.certificate.certificate_pem}

${acme_certificate.certificate.issuer_pem}
    EOT
}

# to make life easier when installing
resource "local_file" "ssl_private_key_file" {
  sensitive_content = acme_certificate.certificate.private_key_pem
  filename          = "./site_ssl_private_key.pem"
}

resource "local_file" "ssl_cert_file" {
  sensitive_content = acme_certificate.certificate.certificate_pem
  filename          = "./site_ssl_cert.pem"
}

resource "local_file" "ssl_cert_bundle_file" {
  sensitive_content = local.cert_bundle
  filename          = "./site_ssl_cert_bundle.pem"
}
