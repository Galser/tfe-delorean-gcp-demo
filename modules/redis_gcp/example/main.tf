module "redis_gcp" {
  source = "../"
}

output "redis_gcp" {
  value = module.redis_gcp
}
