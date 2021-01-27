# Compute (GCP) module code
terraform {
  required_version = ">= 0.12"
}

resource "google_compute_instance" "ptfe" {

  // we not using here config map
  name         = var.name
  machine_type = var.instance_type
  zone         = var.availabilityZone
  tags         = ["${var.name}-andrii", "tfe"]

  boot_disk {
    initialize_params {
      image = var.image
      size  = 80 // not alway fitting for experimetns in 40-50 as recommended
    }
  }


  network_interface {
    network    = var.network
    subnetwork = var.subnetwork
    access_config {
    }
  }

  metadata = {
    ssh-keys = "ubuntu:${file("${var.public_key_path}")}"
    # user-data* -> Cloud Init Supported OS
    user-data = var.cloudinit
    #user-data-encoding = var.cloudinit.encoding
  }

  connection {
    user        = "ubuntu"
    type        = "ssh"
    private_key = file(var.key_path)
    host        = self.network_interface.0.access_config.0.nat_ip
  }

  /*  provisioner "file" {
    content = var.replicated_config
    destination = "/etc/replicated.conf"
  }

  provisioner "file" {
    content = var.tfe_config
    destination = "/etc/tfe-settings.json"
  }

  provisioner "remote-exec" {
    script = "${path.module}/scripts/provision.sh"
  }
*/

}

