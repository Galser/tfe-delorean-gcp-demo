module "db_gcp" {
  source = "../"
}

output "db_gcp" {
  value = module.db_gcp
}
