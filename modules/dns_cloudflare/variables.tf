# parameters for the dns_cloudflare module
variable "domain" {
  description = "The DOMAIN part of the record"
}

variable "host" {
  description = "The HOST part of the record"
}

variable "frontend_ip" {
  description = "The IP address for the record ofr Frontend"
}

/*variable "backend_ip" {
  description = "The IP address for the record of backend (1 instance in case of TFE v4) "
}
*/
