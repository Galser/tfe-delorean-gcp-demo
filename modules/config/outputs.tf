# Configs module outputs
output "replicated_console_password" {
  value       = random_string.replicated_console_password.result
  description = "The generated password for the admin console."
}

output "replicated_config" {
  description = "Replicated config - /etc/replicated.conf"
  value       = data.template_file.replicated_config.rendered
}

output "tfe_config" {
  description = "Tfe config - /etc/ptfe-settings.json"
  value       = data.template_file.tfe_config.rendered
}

output "cloudinit" {
  value       = data.template_cloudinit_config.cloud_init_config.rendered
  description = "Rendered cloud-init templates to pass to primary instances."
}


output "admin_user_data" {
  description = "Admin user data"
	sensitive = false
  value = {
    name     = var.admin_name
    email    = var.admin_email
    password = nonsensitive(var.admin_password)
  }

}
