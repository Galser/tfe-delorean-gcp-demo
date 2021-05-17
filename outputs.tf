/* output "redis_gcp" { 
 value = {
 	host = module.redis_gcp.host
 	port = module.redis_gcp.port
 }
} */

output "data_for_tfe" {
  value = {
		application_endpoint = "https://${var.tfe_name}.${var.site_domain}"
    loadbalancer_ip      = module.lb_gcp.lb_ip
    admin_user_data      = module.config.admin_user_data
  }
}
