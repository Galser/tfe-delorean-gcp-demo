# Outputs for "sslcert_letsencrypt" module
# note that if you want the full 

output "cert_pem" {
  value = acme_certificate.certificate.certificate_pem
}

output "cert_private_key_pem" {
  value = acme_certificate.certificate.private_key_pem
}

output "cert_url" {
  value = acme_certificate.certificate.certificate_url
}

output "cert_issuer_pem" {
  value = acme_certificate.certificate.issuer_pem
}

output "cert_bundle" {
  description = "Full certificate bundle, for example for installing in the system that does not recognize Let'sEncrypt"
  value       = local.cert_bundle
}

output "gcp_cert_link" {
  description = "Link to teh certificate uploaded into GCP"
  value       = google_compute_ssl_certificate.tfe.self_link
}

