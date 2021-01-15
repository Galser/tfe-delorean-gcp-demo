# External Services

# Redis ( Memorystore)
module "redis_gcp" {
  source = "./modules/redis_gcp"
  name = "${var.tfe_name}-redis"
  size = 1
 # project = var.project
}


