# Compute Instance Group (GCP) module variables
variable "name" {
  description = "Name of the project for your tfe installation"
  type        = string
}

variable "instances" {
  description = "List of instances to attach into group"
  type        = list(any)
  default     = []
}

variable "availabilityZone" {
  type = string
}