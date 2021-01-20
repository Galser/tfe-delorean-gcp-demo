# parameters for the sslcert_letsencrypt module
variable "domain" {
  description = "The DOMAIN part of the record"
}

variable "host" {
  description = "The HOST part of the record"
}

variable "dns_provider" {
  description = "Short name of the DSN provider for our site"
  # "godaddy", "cloudflare" , etc...
}