module "objectstorage_gcp" {
  source = "../"
}

output "objectstorage_gcp" {
  value = module.objectstorage_gcp
}
