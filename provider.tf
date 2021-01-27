terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "2.14.0"
    }
    acme = {
      source  = "vancluever/acme"
      version = "1.6.3"
    }
  }
}

provider "google" {
  credentials = file(var.credentials_file)

  project = var.project
  region  = var.region
  zone    = var.availabilityZone
}

provider "google-beta" {
  #  version     = "~> 3.0"
  credentials = file(var.credentials_file)

  region  = var.region
  project = var.project
  zone    = var.availabilityZone
}

provider "acme" {
  # PRODUCTION
  #  version    = "~> 1.0"
  server_url = "https://acme-v02.api.letsencrypt.org/directory"
  # STAGING
  # "https://acme-staging-v02.api.letsencrypt.org/directory"
}

provider "cloudflare" {
  #  version = "~> 2.0"
}
