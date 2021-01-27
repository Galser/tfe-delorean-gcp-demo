# Configs module code
resource "random_string" "replicated_console_password" {
  length  = 24
  special = false
}

data "template_file" "cloud_init_config" {
  template = file("${path.module}/templates/cloud-config.yaml")

  #gzip          = false // for GCP 
  #base64_encode = false // for GCP 

  vars = {
    #    tfe_install_url = var.tfe_install_url
    #    distribution    = var.distribution
    license_b64    = filebase64(var.license_file)
    install_tfe_sh = base64encode(file("${path.module}/scripts/provision.sh"))

    replicated-conf = base64encode(data.template_file.replicated_config.rendered)
    tfe_conf        = base64encode(data.template_file.tfe_config.rendered)
  }
}

data "template_cloudinit_config" "cloud_init_config" {
  gzip          = false
  base64_encode = false

  part {
    content_type = "text/cloud-config"
    content      = data.template_file.cloud_init_config.rendered
  }
}


data "template_file" "replicated_config" {
  template = file("${path.module}/templates/replicated.conf.tmpl")

  vars = {
    airgap                      = false
    tls_boostrap_type           = "self-signed"
    hostname                    = var.hostname
    replicated_console_password = random_string.replicated_console_password.result
    release_sequence            = var.release_sequence
    channel_id                  = var.channel_id
  }
}

data "template_file" "tfe_config" {
  template = file("${path.module}/templates/tfe-settings.json.tmpl")

  vars = {
    hostname = var.hostname

    pg_netloc       = var.postgres_config.netloc
    pg_dbname       = var.postgres_config.dbname
    pg_user         = var.postgres_config.user
    pg_password     = var.postgres_config.password
    pg_extra_params = var.postgres_config.extra_params

    gcs_bucket      = var.object_store_config.bucket
    gcs_credentials = var.object_store_config.credentials
    gcs_project     = var.object_store_config.project

    redis_host = var.redis_config.host
    redis_port = var.redis_config.port

    user_token                      = var.user_token
    archivist_token                 = var.archivist_token
    cookie_hash                     = var.cookie_hash
    install_id                      = var.install_id
    root_secret                     = var.root_secret
    enc_password                    = var.enc_password
    registry_session_encryption_key = var.registry_session_encryption_key
    registry_session_secret_key     = var.registry_session_secret_key
    internal_api_token              = var.internal_api_token
    backup_token                    = var.backup_token
  }
}