terraform {
  required_version = ">= 0.12"
}

resource "google_compute_instance" "ptfe" {
  name         = var.name
  machine_type = var.instance_type
  zone         = var.availabilityZone
  tags         = ["${var.name}-andrii", "tfe"]

  boot_disk {
    initialize_params {
      image = var.image
      size  = 80
    }
  }


  network_interface {
    network = var.network
    subnetwork = var.subnetwork
    access_config {
    }
  }

  metadata = {
    ssh-keys = "ubuntu:${file("${var.public_key_path}")}"
  }

  connection {
    user        = "ubuntu"
    type        = "ssh"
    private_key = file(var.key_path)
    host        = self.network_interface.0.access_config.0.nat_ip
  }

  provisioner "remote-exec" {
    script = "${path.module}/scripts/provision.sh"
  }

  /* provisioner "file" {
    source      = "${path.module}/scripts/mount-ebs.sh"
    destination = "/tmp/mount-ebs.sh"
  }

  provisioner "file" {
    source      = "${path.module}/scripts/delete_all.sh"
    destination = "/tmp/delete_all.sh"
  } */

}

