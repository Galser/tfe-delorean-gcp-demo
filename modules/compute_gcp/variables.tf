variable "name" {
  type        = string
  description = "Name for tags and etc"
}

variable "image" {
  type = string
  default = "ubuntu-os-cloud/ubuntu-1804-lts"
}

variable "instance_type" {
  type = string
  description = "Type of instance"
  default     = "n1-standard-4"
}


variable "availabilityZone" {
  type = string
  description = "Availability zone"
}

variable "key_path" {
  type = string
  description = "Local SSH key path (private part)"
}

variable "public_key_path" {
  type = string
  description = "Local SSH key path (public part)"
}

variable "network" {
  type        = string
  description = "network"
  # no default
}

variable "subnetwork" {
  type        = string
  description = "Sub-network"
  # no default
}
