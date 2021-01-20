# Compute Instance Group (GCP) module outputs
output "link" {
  value = google_compute_instance_group.ptfe_group.self_link
}