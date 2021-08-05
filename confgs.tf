resource "random_id" "user_token" {
  byte_length = 16
}

resource "random_id" "archivist_token" {
  byte_length = 16
}

// what we using cookie_hash for ?? 
resource "random_id" "cookie_hash" {
  byte_length = 16
}

resource "random_id" "install_id" {
  byte_length = 16
}

resource "random_id" "root_secret" {
  byte_length = 16
}

# Requires hex output
resource "random_id" "registry_session_secret_key" {
  byte_length = 16
}

# Requires hex output
resource "random_id" "registry_session_encryption_key" {
  byte_length = 16
}

# Requires hex output
resource "random_id" "internal_api_token" {
  byte_length = 16
}

resource "random_id" "enc_password" {
  byte_length = 16
}

resource "random_id" "backup_token" {
  byte_length = 16
}

resource "random_password" "admin_password" {
  length  = 18
  // special = true
  special = false // for some symbols - my JSON generation fails
}


module "config" {
  source = "./modules/config"

  license_file        = var.license_file
  hostname            = local.hostname
  postgres_config     = module.db_gcp.postgres_config
  object_store_config = module.objectstorage_gcp.object_storage_config
  project             = var.project
  //add_bash_debug      = true

  release_sequence = var.release_sequence
  channel_id       = var.channel_id

  redis_config = module.redis_gcp.redis_config

  admin_name     = var.admin_name
  admin_email    = var.admin_email
  admin_password = random_password.admin_password.result

  user_token                      = random_id.user_token.hex
  archivist_token                 = random_id.archivist_token.hex
  cookie_hash                     = random_id.cookie_hash.hex
  install_id                      = random_id.install_id.hex
  root_secret                     = random_id.root_secret.hex
  enc_password                    = random_id.enc_password.hex
  registry_session_encryption_key = random_id.registry_session_encryption_key.hex
  registry_session_secret_key     = random_id.registry_session_secret_key.hex
  internal_api_token              = random_id.internal_api_token.hex
  backup_token                    = random_id.backup_token.hex
}


output "backup_token" {
 value = random_id.backup_token.hex
}
