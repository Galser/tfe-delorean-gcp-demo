# null resource sslcert_letsencrypt
resource null_resource "sslcert_letsencrypt" {
}

output "sslcert_letsencrypt" {
  value = "from sslcert_letsencrypt"
}
