#------------------------------------------------------------------------
# Main TF code for TFE Delorean on GCP 
# ( - basically set of includes for modules
# 

# Local vars 
locals {
  hostname = join(".", [var.tfe_name, var.site_domain])
}

#=========================================================================
# Network
# Network : GCP - VCP, network, subnetwork
module "network_gcp" {
  source = "./modules/network_gcp/"
  name   = var.tfe_name
  region = var.region
}


## Debug intermediate output 
# output "network_gcp" {
#   value = module.network_gcp
# }

# Network : Firewall
module "firewall_gcp" {
  source       = "./modules/firewall_gcp"
  name         = var.tfe_name
  network      = module.network_gcp.network.name
  subnet_range = module.network_gcp.network.subnet_range
}

# Network : Load-balancer on GCP
# Note - depends from computing resources and certificates 
# defined below in the code
# Network : LB
module "lb_gcp" {
  source = "./modules/lb_gcp"
  name   = var.tfe_name
  // instance_group   = module.compute_instance_group.link // 1 instance 
  instance_group   = module.compute_templated_gcp.managed_instance_group
  project          = var.project
  ssl_certificates = [module.sslcert_letsencrypt.gcp_cert_link]
  // ! list ^^^
  tfe_name    = var.tfe_name
  site_domain = var.site_domain
  tags        = { "app" : "tfe" }
}

## Debug intermediate output 
# output "lb_gcp" {
#   value = module.lb_gcp
# }

# Network : DNS CloudFlare
# Note - depends from Load-Balancer and computing 
# resources defined below in the code
module "dns_cloudflare" {
  source = "./modules/dns_cloudflare"

  host   = var.tfe_name
  domain = var.site_domain
  #  cname_target = module.lb_aws.fqdn
  frontend_ip = module.lb_gcp.lb_ip

  //backend_ip = module.compute_gcp.instance_data.public_ip
}



#=========================================================================
# External services : DB, Object Storage, Redis (e.g. shared memory 
# storage used in Active-Active TFE setup)

# External Services : DB
module "db_gcp" {
  source     = "./modules/db_gcp/"
  name       = var.tfe_name
  username   = var.db_admin
  region     = var.region
  tier       = "db-custom-4-16384"
  network_id = module.network_gcp.network.id
}

## Debug intermediate output 
# output "db_gcp" {
#   value = module.db_gcp.postgres_config
# }

#  External Services : Onject Storage
module "objectstorage_gcp" {
  source   = "./modules/objectstorage_gcp/"
  name     = var.tfe_name
  location = var.region
}

## Debug intermediate output 
# output "objectstorage_gcp_config" {
#   value = module.objectstorage_gcp.object_storage_config
# }

#  External Services : Redis ( Memorystore)
module "redis_gcp" {
  source  = "./modules/redis_gcp"
  name    = "${var.tfe_name}-redis"
  size    = 1
  network = module.network_gcp.network.name
}


#=========================================================================
#=========================================================================
# Configs are in a separate file as it contains a lot of small definitions
#-------------------------------------------------------------------------
#-------------------------------------------------------------------------

# Certificate : SSL from Let'sEncrypt
module "sslcert_letsencrypt" {

  source = "./modules/sslcert_letsencrypt"

  host         = var.tfe_name
  domain       = var.site_domain
  dns_provider = "cloudflare"
}

## Debug intermediate output 
# output "sslcert_letsencrypt" {
#   value = module.sslcert_letsencrypt
# }

#=========================================================================
# Computing resources
/*module "compute__gcp" {
  source            = "./modules/compute_gcp/"
  name              = var.tfe_name
  availabilityZone  = var.availabilityZone
  key_path          = var.key_path
  public_key_path   = var.public_key_path
  network           = module.network_gcp.network.name
  subnetwork        = module.network_gcp.network.subnet
  replicated_config = module.config.replicated_config
  tfe_config        = module.config.tfe_config
  cloudinit         = module.config.cloudinit
}
*/

# TFE Server
module "compute_templated_gcp" {
  source = "./modules/compute_templated_gcp//"
  name   = var.tfe_name
  //availabilityZone  = var.availabilityZone
  region            = var.region
  machines_count    = var.machines_count
  key_path          = var.key_path
  public_key_path   = var.public_key_path
  network           = module.network_gcp.network.name
  subnetwork        = module.network_gcp.network.subnet
  replicated_config = module.config.replicated_config
  tfe_config        = module.config.tfe_config
  cloudinit         = module.config.cloudinit
	instance_config   = {
    machine_type   = "n2-standard-8"
    image_family   = "ubuntu-1804-lts"
    image_project  = "ubuntu-os-cloud"
    boot_disk_size = 80
    type           = "pd-ssd"
	}
}

## agents

# Region 1


module "compute_gcp_europe" {
  count             = var.agents_machine_count
  source            = "./modules/compute_gcp/"
  name              = "${var.tfe_name}-agent-${count.index}"
  availabilityZone  = var.availabilityZone
  key_path          = var.key_path
  public_key_path   = var.public_key_path
  network           = module.network_gcp.network.name
  subnetwork        = module.network_gcp.network.subnet
  instance_type     = "n1-standard-4"
  replicated_config = ""
  tfe_config        = ""
	#cloudinit         = file("modules/tfc_agent/scrtips/tfc-agent-provision.sh")
	cloudinit				  = ""
}





## Debug intermediate output 
# output "compute_gcp" {
#   value = module.compute_gcp
# }

/*module "compute_instance_group" {
  source           = "./modules/compute_instance_group/"
  name             = var.tfe_name
  availabilityZone = var.availabilityZone
  instances        = [module.compute_gcp.instance_data.link]
}
*/
## Debug intermediate output 
# output "compute_instance_group" {
#   value = module.compute_instance_group
# }


