# Compute (GCP) module outputs for templated instance
# ro be runned with instance group manager 
output "managed_instance_group" {
  value = google_compute_region_instance_group_manager.main.instance_group
}