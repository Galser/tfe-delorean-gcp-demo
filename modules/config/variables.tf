variable "project" {
  description = "The project ID to create the resources in."
  type        = string
}

variable "hostname" {
  description = "Host name"
  type        = string
}

variable "airgap" {
  default = false
}

variable "replicated_console_password" {
  default = ""
}

variable "tls_boostrap_type" {
  default = "self-signed"
}

variable "tls_boostrap_cert" {
  default = ""
}

variable "tls_boostrap_key" {
  default = ""
}

variable "release_sequence" {
  default     = "latest"
  description = "The sequence ID for the Terraform Enterprise version to pin (щк тще)"
}

variable "channel_id" {
  default = "default"
}
// 
variable "license_file" {
  type        = string
  description = "Path to license file for the TFE"
}

variable "postgres_config" {
  description = "Postgres configuration"
  type = object({
    netloc       = string
    dbname       = string
    user         = string
    password     = string
    extra_params = string
  })
}

variable "object_store_config" {
  description = "Object storage configuration"
  type = object({
    bucket      = string
    credentials = string
    project     = string
  })
}

variable "redis_config" {
  type = object({
    host = string
    port = string
  })
}

//Iniial admin data
variable "admin_name" {
  default = "admin"
}
variable "admin_email" {}
variable "admin_password" {}


// tokens
variable "user_token" {}
variable "archivist_token" {}
variable "cookie_hash" {}
variable "install_id" {}
variable "root_secret" {}
variable "enc_password" {}
variable "registry_session_encryption_key" {}
variable "registry_session_secret_key" {}
variable "internal_api_token" {}
variable "backup_token" {}


