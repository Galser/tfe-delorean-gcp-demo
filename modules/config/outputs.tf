# Configs module outputs
output "replicated_console_password" {
  value       = random_string.replicated_console_password.result
  description = "The generated password for the admin console."
}

output "replicated_config" {
  description = "Intermediate file - /etc/tfe/replicated.conf"
  value       = data.template_file.replicated_config.rendered
}

output "tfe_config" {
  description = "Intermediate file - /etc/tfe/replicated-tfe.conf"
  value       = data.template_file.tfe_config.rendered
}