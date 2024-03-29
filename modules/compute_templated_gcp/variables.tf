variable "name" {
  type        = string
  description = "Name for tags and etc"
}

variable "author" {
  default = "guselietov"
}

/* variable "image" {
  type    = string
  default = "ubuntu-os-cloud/ubuntu-1804-lts"
}
*/

variable "instance_type" {
  type        = string
  description = "Type of instance"
  default     = "n2-standard-8"
}

# Disabled for now
variable "auto_healing_enabled" {
  type        = bool
  description = "Should the autohealing should be turned on for the instance group manager."
  default     = false
}

/*variable "availabilityZone" {
  type        = string
  description = "Availability zone"
}
*/

variable "machines_count" {
  description = "How many VMs (instances) in a group"
  default     = 1
}

variable "region" {
  type        = string
  description = "Region"
}


variable "key_path" {
  type        = string
  description = "Local SSH key path (private part)"
}

variable "public_key_path" {
  type        = string
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

# not used now
variable "instances_count" {
  type        = number
  description = "How many instance(s) do you want?"
  default     = 1
}

variable "instance_config" {
  type = object({
    machine_type   = string
    image_family   = string
    image_project  = string
    boot_disk_size = number
    type           = string
  })
  default = {
    machine_type   = "n2-standard-8"
    image_family   = "ubuntu-1804-lts"
    image_project  = "ubuntu-os-cloud"
    boot_disk_size = 60
    type           = "pd-ssd"
  }
}

# Replcated & TFE configs
variable "tfe_config" {
  type        = string
  description = "TFE config (application.json). Usually we locating it (temporary) at /etc/ptfe-settings.json"
  # no default
}

variable "replicated_config" {
  type        = string
  description = "Replicated config - /etc/replicated.conf"
  # no default
}

variable "cloudinit" {
  description = "Rendered cloud-init templates to pass to new primary instances."
}