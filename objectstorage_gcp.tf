module "objectstorage_gcp" {
  source = "./modules/objectstorage_gcp/"
  name = var.tfe_name
  location = var.region
}

output "objectstorage_gcp_config" {
  value = module.objectstorage_gcp.object_storage_config
}

