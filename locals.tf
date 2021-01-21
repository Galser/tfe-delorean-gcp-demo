locals {
  hostname = join(".", [var.tfe_name, var.site_domain])
}