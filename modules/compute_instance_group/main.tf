# null resource compute_instance_group
resource null_resource "compute_instance_group" {
}

output "compute_instance_group" {
  value = "from compute_instance_group"
}
