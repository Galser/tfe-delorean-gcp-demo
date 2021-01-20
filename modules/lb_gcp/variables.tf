variable "project" {
  description = "The project ID to create the resources in."
  type        = string
}

variable "name" {
  description = "Name for the load balancer forwarding rule and prefix for supporting resources."
  type        = string
}

variable "ssl_certificates" {
  description = "List of SSL cert self links."
  type        = list(string)
  default     = []
}

variable "instance_group" {
  description = "Link to instance group"
  default     = ""
}

variable "tags" {
  description = "A map of tags(labels) to apply to the resources."
  type        = map(string)
  default     = {}
}


variable "site_domain" {
  default = ""
}

variable "tfe_name" {
  default = ""
}
