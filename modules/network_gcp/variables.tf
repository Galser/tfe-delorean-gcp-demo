# Network variables code
variable "name" {
  type        = string
  description = "Name (prefix) apply to resources"
}

variable "region" {
  type        = string
  description = "The region "
  # no default!
}

variable "subnet_range" {
  type        = string
  description = "CIDR range for subnet(s)"
  default     = "10.0.0.0/16"
}
