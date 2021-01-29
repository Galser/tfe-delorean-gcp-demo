// GCP Vars 
variable "project" {
  type = string
}

variable "credentials_file" {
  type = string
}

variable "region" {
  type = string
}

variable "availabilityZone" {
  type = string
}
// end of GCP data

// TFE DNS Settings
// The ones that by default should be avaible in CloudFlare
// for _this_ example
variable "site_domain" {
  type    = string
  default = "guselietov.com"
}

variable "tfe_name" {
  type    = string
  default = "tfe-aa"
}

variable "key_path" {
  type = string
}

variable "public_key_path" {
  type = string
}

// Network settingds and tags

variable "cidrs" {
  default = ["10.0.0.0/16", "10.1.0.0/16"]
}

# Optionals but usefull
variable "vpc_tag" {
  type    = string
  default = "ag_tfe_delorean"
}

variable "disks_tag" {
  type    = string
  default = "ag_tfe_delorean"
}

variable "db_admin" {
  type    = string
  default = "hashicorp"
}


// License & releases
variable "license_file" {
  type = string
}

variable "release_sequence" {
  default     = "latest"
  description = "The sequence ID for the Terraform Enterprise version to pin (щк тще)"
}

variable "channel_id" {
  default = "default"
}

// Inital admin
//Iniial admin data
variable "admin_name" {
  default = "admin"
}
variable "admin_email" {}


