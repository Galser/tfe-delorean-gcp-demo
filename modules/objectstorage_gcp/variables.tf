# Objectstorage (GCP) module Variables
variable "name" {
  type        = string
  description = "Name(prefix) for resources"
}

variable "location" {
  type        = string // EU, US ...etc
  description = "Location for bucket, region"
  # no defaults!!
}

/* variable "ip_allow_list" {
  type        = list
  description = "IP CIDRs to alow. Defaults to the entire world for nbw."
  default     = ["0.0.0.0/0"]
}

# EMPTY BY DEFAULT
variable "additional_firewall_ports" {
  type        = list(string)
  description = "Additional ports to allow through the firewall , for testing"
  default     = []
}

variable "network" {
  type        = string
  description = "network"
  # no default
}
*/ 

