# Compute (GCP) module code for templated instance
# ro be runned with instance group manager 
terraform {
  required_version = ">= 0.12"
}

# ========================
data "google_compute_zones" "available" {
  region = var.region
}

data "google_compute_image" "image" {
  family  = var.instance_config.image_family
  project = var.instance_config.image_project
}


/*resource "google_compute_instance" "ptfe" {

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
}
*/

resource "google_compute_health_check" "tfe-https-health-check" {
  name                = "${var.name}-tfe-health-check"
  check_interval_sec  = 90 // 60 ?  
  timeout_sec         = 15 // it is slow sometimes
  healthy_threshold   = 3  // 2
  unhealthy_threshold = 7  // 6

  https_health_check {
    port         = 443
    request_path = "/_health_check"
  }
}


resource "google_compute_instance_template" "ptfe_main" {
  name_prefix    = "${var.name}-tfe-template-"
  machine_type   = var.instance_type
  region         = var.region
  can_ip_forward = true // hether to allow sending and receiving of packets with 
  // non-matching source or destination IPs.

  labels = {
    environment = var.name
    author      = var.author
  }

  disk {
    source_image = data.google_compute_image.image.self_link
    boot         = true
    disk_size_gb = var.instance_config.boot_disk_size
    disk_type    = var.instance_config.type
    auto_delete  = true
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork
    access_config {
    }

    /*    dynamic "access_config" {
      for_each = true ? ["one"] : []
      content {}
    } */
  }

  metadata = {
    # user-data for cloud Init Supported OS
    user-data          = var.cloudinit.content
    user-data-encoding = var.cloudinit.encoding
    ssh-keys           = "ubuntu:${file("${var.public_key_path}")}" // ?
  }

  lifecycle {
    create_before_destroy = true
  }
}


resource "google_compute_region_instance_group_manager" "main" {
  name = "${var.name}-tfe-aa-group-manager"

  base_instance_name = "${var.name}-tfe-aa-vm"
  region             = var.region

  version {
    instance_template = google_compute_instance_template.ptfe_main.self_link
  }

  target_size = var.machines_count

  named_port {
    name = "https"
    port = 443
  }

  dynamic "auto_healing_policies" {
    for_each = var.auto_healing_enabled ? ["one"] : []
    content {
      health_check      = google_compute_health_check.tfe-https-health-check.self_link
      initial_delay_sec = 600
    }
  }
}

