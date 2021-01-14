module "tfe-delorean-gcp-demo" {
  source = "../"
}

output "tfe-delorean-gcp-demo" {
  value = module.tfe-delorean-gcp-demo
}
