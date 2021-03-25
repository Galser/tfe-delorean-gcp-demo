## Terraform destroy full log

```Terraform

terraform destroy --auto-approve
module.dns_cloudflare.data.cloudflare_zones.site_zone: Refreshing state... [id=af2024111cd5bf0ca1356e1c930ac788]
module.sslcert_letsencrypt.tls_private_key.private_key: Refreshing state... [id=99cd58c88bfcea7fb8bc37bcf378b790106a6847]
module.lb_gcp.google_compute_global_address.tfe: Refreshing state... [id=projects/ag-tfe-aa/global/addresses/tfe-aa-address]
module.objectstorage_gcp.random_pet.bucket_name_suffix: Refreshing state... [id=lucky-chamois]
module.network_gcp.google_compute_network.tfe_vpc: Refreshing state... [id=projects/ag-tfe-aa/global/networks/tfe-aa-vpc]
module.compute_templated_gcp.google_compute_health_check.tfe-https-health-check: Refreshing state... [id=projects/ag-tfe-aa/global/healthChecks/tfe-aa-tfe-health-check]
module.lb_gcp.google_compute_ssl_policy.tfe_ssl: Refreshing state... [id=projects/ag-tfe-aa/global/sslPolicies/tfe-aa-tfe]
random_id.cookie_hash: Refreshing state... [id=NEmO67bsIrfn7-Val2Kgbw]
random_id.internal_api_token: Refreshing state... [id=F0VkkvYII3rsZMvY40p9Vw]
module.config.random_string.replicated_console_password: Refreshing state... [id=VCqGGJffdcUKT2gaiq4x3C2B]
module.objectstorage_gcp.google_service_account.tfe_bucket: Refreshing state... [id=projects/ag-tfe-aa/serviceAccounts/tfe-aa-tfe-bucket@ag-tfe-aa.iam.gserviceaccount.com]
module.lb_gcp.google_compute_health_check.primary: Refreshing state... [id=projects/ag-tfe-aa/global/healthChecks/tfe-aa-primary-healthcheck]
random_id.registry_session_secret_key: Refreshing state... [id=MSqt1K4K-sjXNQVx_8F-jA]
random_password.admin_password: Refreshing state... [id=none]
random_id.registry_session_encryption_key: Refreshing state... [id=SeFDcBch345hkz1N-q8Akg]
random_id.archivist_token: Refreshing state... [id=d0k4Loqkf63qSbFK0g1VLQ]
random_id.user_token: Refreshing state... [id=Nal4MFVhDGn2F8AS0TS11g]
random_id.enc_password: Refreshing state... [id=q0JrMLacUHjyMiKUpelhnQ]
module.db_gcp.random_pet.dbname_suffix: Refreshing state... [id=top-crawfish]
module.compute_templated_gcp.data.google_compute_zones.available: Refreshing state... [id=projects/ag-tfe-aa/regions/europe-west4]
random_id.install_id: Refreshing state... [id=cOHCglVT0g1Xo2A488suTA]
module.db_gcp.random_password.password: Refreshing state... [id=none]
random_id.root_secret: Refreshing state... [id=r7HMoPkNLxNrE_ZgYJEocw]
random_id.backup_token: Refreshing state... [id=kUa83XgvCBNANe7myE5hYQ]
module.compute_templated_gcp.data.google_compute_image.image: Refreshing state... [id=projects/ubuntu-os-cloud/global/images/ubuntu-1804-bionic-v20210323]
module.sslcert_letsencrypt.acme_registration.reg: Refreshing state... [id=https://acme-v02.api.letsencrypt.org/acme/acct/116811679]
module.objectstorage_gcp.google_storage_bucket.tfe: Refreshing state... [id=tfe-aa-lucky-chamois]
module.config.data.template_file.replicated_config: Refreshing state... [id=648f05b35484e7f9156c3853c33d4a574ac16515cc24275bcbd8296d4016eb2a]
module.sslcert_letsencrypt.acme_certificate.certificate: Refreshing state... [id=https://acme-v02.api.letsencrypt.org/acme/cert/03f99dbc7e0f27de3429404b3729c606e4a7]
module.config.data.template_file.initial_admin_script: Refreshing state... [id=bca918330173debcf67d3c9078d3365f22bcebbf1052baa697a509ae274df8d1]
module.sslcert_letsencrypt.local_file.ssl_cert_file: Refreshing state... [id=bc022ced9f540337a3e3846ea886d5663937e7b5]
module.sslcert_letsencrypt.local_file.ssl_private_key_file: Refreshing state... [id=ad70270475b0323e889019cbf224a7d6e3bb55e4]
module.sslcert_letsencrypt.google_compute_ssl_certificate.tfe: Refreshing state... [id=projects/ag-tfe-aa/global/sslCertificates/tfe-aa-tfe-20210324143632145200000001]
module.sslcert_letsencrypt.local_file.ssl_cert_bundle_file: Refreshing state... [id=5264b100839ef2aa2fc863e9dfded913dee2cfdf]
module.network_gcp.google_compute_router.tfe_router: Refreshing state... [id=projects/ag-tfe-aa/regions/europe-west4/routers/tfe-aa-router]
module.network_gcp.google_compute_subnetwork.tfe_subnet: Refreshing state... [id=projects/ag-tfe-aa/regions/europe-west4/subnetworks/tfe-aa-subnet]
module.dns_cloudflare.cloudflare_record.site_lb: Refreshing state... [id=71704c5356b29cd36bb8c0d3f493b8d8]
module.network_gcp.google_compute_router_nat.nat: Refreshing state... [id=ag-tfe-aa/europe-west4/tfe-aa-router/tfe-aa-router-nat]
module.db_gcp.google_compute_global_address.private_ip_address: Refreshing state... [id=projects/ag-tfe-aa/global/addresses/tfe-aa-private-ip-address]
module.redis_gcp.google_redis_instance.redis_gcp: Refreshing state... [id=projects/ag-tfe-aa/locations/europe-west4/instances/tfe-aa-redis]
module.firewall_gcp.google_compute_firewall.tfe-vault: Refreshing state... [id=projects/ag-tfe-aa/global/firewalls/tfe-aa-firewall-vault]
module.firewall_gcp.google_compute_firewall.tfe: Refreshing state... [id=projects/ag-tfe-aa/global/firewalls/tfe-aa-firewall]
module.objectstorage_gcp.google_storage_bucket_iam_member.member-bucket: Refreshing state... [id=b/tfe-aa-lucky-chamois/roles/storage.legacyBucketReader/serviceaccount:tfe-aa-tfe-bucket@ag-tfe-aa.iam.gserviceaccount.com]
module.objectstorage_gcp.google_storage_bucket_iam_member.member-object: Refreshing state... [id=b/tfe-aa-lucky-chamois/roles/storage.objectAdmin/serviceaccount:tfe-aa-tfe-bucket@ag-tfe-aa.iam.gserviceaccount.com]
module.objectstorage_gcp.google_service_account_key.tfe_bucket: Refreshing state... [id=projects/ag-tfe-aa/serviceAccounts/tfe-aa-tfe-bucket@ag-tfe-aa.iam.gserviceaccount.com/keys/a209a4d5149afe65cea7a340a9eb42f372ed5a8e]
module.db_gcp.google_service_networking_connection.private_vpc_connection: Refreshing state... [id=projects%2Fag-tfe-aa%2Fglobal%2Fnetworks%2Ftfe-aa-vpc:servicenetworking.googleapis.com]
module.db_gcp.google_sql_database_instance.tfemaster: Refreshing state... [id=tfeaa-top-crawfish]
module.db_gcp.google_sql_database.tfedatabase: Refreshing state... [id=projects/ag-tfe-aa/instances/tfeaa-top-crawfish/databases/tfeaa-top-crawfish]
module.db_gcp.google_sql_user.tfeadmin: Refreshing state... [id=hashicorp//tfeaa-top-crawfish]
module.config.data.template_file.tfe_config: Refreshing state... [id=c42cdcc72770f87cb2de466435c5ac7db358ba60a7b8eebd722576d5a7aee1e0]
module.config.data.template_file.cloud_init_config: Refreshing state... [id=ed8165fcc2ac22bd8a93960f7f9b03a00c2f76e0b0dc243c9b863c0a729a6130]
module.config.data.template_cloudinit_config.cloud_init_config: Refreshing state... [id=3842545104]
module.compute_templated_gcp.google_compute_instance_template.ptfe_main: Refreshing state... [id=projects/ag-tfe-aa/global/instanceTemplates/tfe-aa-tfe-template-20210324144744030500000002]
module.compute_templated_gcp.google_compute_region_instance_group_manager.main: Refreshing state... [id=projects/ag-tfe-aa/regions/europe-west4/instanceGroupManagers/tfe-aa-tfe-aa-group-manager]
module.lb_gcp.google_compute_backend_service.primary: Refreshing state... [id=projects/ag-tfe-aa/global/backendServices/tfe-aa-primary-backend]
module.lb_gcp.google_compute_url_map.tfe: Refreshing state... [id=projects/ag-tfe-aa/global/urlMaps/tfe-aa-urlmap]
module.lb_gcp.google_compute_target_https_proxy.tfe: Refreshing state... [id=projects/ag-tfe-aa/global/targetHttpsProxies/tfe-aa-https-proxy]
module.lb_gcp.google_compute_global_forwarding_rule.https: Refreshing state... [id=projects/ag-tfe-aa/global/forwardingRules/tfe-aa-https]
module.sslcert_letsencrypt.local_file.ssl_cert_file: Destroying... [id=bc022ced9f540337a3e3846ea886d5663937e7b5]
module.sslcert_letsencrypt.local_file.ssl_private_key_file: Destroying... [id=ad70270475b0323e889019cbf224a7d6e3bb55e4]
module.sslcert_letsencrypt.local_file.ssl_cert_bundle_file: Destroying... [id=5264b100839ef2aa2fc863e9dfded913dee2cfdf]
module.sslcert_letsencrypt.local_file.ssl_private_key_file: Destruction complete after 0s
module.sslcert_letsencrypt.local_file.ssl_cert_file: Destruction complete after 0s
module.dns_cloudflare.cloudflare_record.site_lb: Destroying... [id=71704c5356b29cd36bb8c0d3f493b8d8]
module.objectstorage_gcp.google_storage_bucket_iam_member.member-bucket: Destroying... [id=b/tfe-aa-lucky-chamois/roles/storage.legacyBucketReader/serviceaccount:tfe-aa-tfe-bucket@ag-tfe-aa.iam.gserviceaccount.com]
module.lb_gcp.google_compute_global_forwarding_rule.https: Destroying... [id=projects/ag-tfe-aa/global/forwardingRules/tfe-aa-https]
module.network_gcp.google_compute_router_nat.nat: Destroying... [id=ag-tfe-aa/europe-west4/tfe-aa-router/tfe-aa-router-nat]
module.firewall_gcp.google_compute_firewall.tfe-vault: Destroying... [id=projects/ag-tfe-aa/global/firewalls/tfe-aa-firewall-vault]
module.firewall_gcp.google_compute_firewall.tfe: Destroying... [id=projects/ag-tfe-aa/global/firewalls/tfe-aa-firewall]
module.sslcert_letsencrypt.local_file.ssl_cert_bundle_file: Destruction complete after 0s
module.objectstorage_gcp.google_storage_bucket_iam_member.member-object: Destroying... [id=b/tfe-aa-lucky-chamois/roles/storage.objectAdmin/serviceaccount:tfe-aa-tfe-bucket@ag-tfe-aa.iam.gserviceaccount.com]
module.dns_cloudflare.cloudflare_record.site_lb: Destruction complete after 1s
module.objectstorage_gcp.google_storage_bucket_iam_member.member-bucket: Destruction complete after 9s
module.objectstorage_gcp.google_storage_bucket_iam_member.member-object: Destruction complete after 10s
module.lb_gcp.google_compute_global_forwarding_rule.https: Still destroying... [id=projects/ag-tfe-aa/global/forwardingRules/tfe-aa-https, 10s elapsed]
module.network_gcp.google_compute_router_nat.nat: Still destroying... [id=ag-tfe-aa/europe-west4/tfe-aa-router/tfe-aa-router-nat, 10s elapsed]
module.firewall_gcp.google_compute_firewall.tfe-vault: Still destroying... [id=projects/ag-tfe-aa/global/firewalls/tfe-aa-firewall-vault, 10s elapsed]
module.firewall_gcp.google_compute_firewall.tfe: Still destroying... [id=projects/ag-tfe-aa/global/firewalls/tfe-aa-firewall, 10s elapsed]
module.firewall_gcp.google_compute_firewall.tfe: Destruction complete after 12s
module.firewall_gcp.google_compute_firewall.tfe-vault: Destruction complete after 12s
module.lb_gcp.google_compute_global_forwarding_rule.https: Destruction complete after 17s
module.lb_gcp.google_compute_global_address.tfe: Destroying... [id=projects/ag-tfe-aa/global/addresses/tfe-aa-address]
module.lb_gcp.google_compute_target_https_proxy.tfe: Destroying... [id=projects/ag-tfe-aa/global/targetHttpsProxies/tfe-aa-https-proxy]
module.network_gcp.google_compute_router_nat.nat: Destruction complete after 17s
module.network_gcp.google_compute_router.tfe_router: Destroying... [id=projects/ag-tfe-aa/regions/europe-west4/routers/tfe-aa-router]
module.lb_gcp.google_compute_global_address.tfe: Still destroying... [id=projects/ag-tfe-aa/global/addresses/tfe-aa-address, 10s elapsed]
module.lb_gcp.google_compute_target_https_proxy.tfe: Still destroying... [id=projects/ag-tfe-aa/global/targetHttpsProxies/tfe-aa-https-proxy, 10s elapsed]
module.network_gcp.google_compute_router.tfe_router: Still destroying... [id=projects/ag-tfe-aa/regions/europe-west4/routers/tfe-aa-router, 10s elapsed]
module.lb_gcp.google_compute_global_address.tfe: Destruction complete after 11s
module.lb_gcp.google_compute_target_https_proxy.tfe: Destruction complete after 11s
module.network_gcp.google_compute_router.tfe_router: Destruction complete after 11s
module.lb_gcp.google_compute_ssl_policy.tfe_ssl: Destroying... [id=projects/ag-tfe-aa/global/sslPolicies/tfe-aa-tfe]
module.sslcert_letsencrypt.google_compute_ssl_certificate.tfe: Destroying... [id=projects/ag-tfe-aa/global/sslCertificates/tfe-aa-tfe-20210324143632145200000001]
module.lb_gcp.google_compute_url_map.tfe: Destroying... [id=projects/ag-tfe-aa/global/urlMaps/tfe-aa-urlmap]
module.sslcert_letsencrypt.google_compute_ssl_certificate.tfe: Still destroying... [id=projects/ag-tfe-aa/global/sslCertificates/tfe-aa-tfe-20210324143632145200000001, 10s elapsed]
module.lb_gcp.google_compute_ssl_policy.tfe_ssl: Still destroying... [id=projects/ag-tfe-aa/global/sslPolicies/tfe-aa-tfe, 10s elapsed]
module.lb_gcp.google_compute_url_map.tfe: Still destroying... [id=projects/ag-tfe-aa/global/urlMaps/tfe-aa-urlmap, 10s elapsed]
module.sslcert_letsencrypt.google_compute_ssl_certificate.tfe: Destruction complete after 12s
module.sslcert_letsencrypt.acme_certificate.certificate: Destroying... [id=https://acme-v02.api.letsencrypt.org/acme/cert/03f99dbc7e0f27de3429404b3729c606e4a7]
module.lb_gcp.google_compute_ssl_policy.tfe_ssl: Destruction complete after 12s
module.lb_gcp.google_compute_url_map.tfe: Destruction complete after 12s
module.lb_gcp.google_compute_backend_service.primary: Destroying... [id=projects/ag-tfe-aa/global/backendServices/tfe-aa-primary-backend]
module.sslcert_letsencrypt.acme_certificate.certificate: Destruction complete after 1s
module.sslcert_letsencrypt.acme_registration.reg: Destroying... [id=https://acme-v02.api.letsencrypt.org/acme/acct/116811679]
module.sslcert_letsencrypt.acme_registration.reg: Destruction complete after 1s
module.sslcert_letsencrypt.tls_private_key.private_key: Destroying... [id=99cd58c88bfcea7fb8bc37bcf378b790106a6847]
module.sslcert_letsencrypt.tls_private_key.private_key: Destruction complete after 0s
module.lb_gcp.google_compute_backend_service.primary: Still destroying... [id=projects/ag-tfe-aa/global/backendServices/tfe-aa-primary-backend, 10s elapsed]
module.lb_gcp.google_compute_backend_service.primary: Destruction complete after 12s
module.lb_gcp.google_compute_health_check.primary: Destroying... [id=projects/ag-tfe-aa/global/healthChecks/tfe-aa-primary-healthcheck]
module.compute_templated_gcp.google_compute_region_instance_group_manager.main: Destroying... [id=projects/ag-tfe-aa/regions/europe-west4/instanceGroupManagers/tfe-aa-tfe-aa-group-manager]
module.compute_templated_gcp.google_compute_region_instance_group_manager.main: Still destroying... [id=projects/ag-tfe-aa/regions/europe-west4...upManagers/tfe-aa-tfe-aa-group-manager, 10s elapsed]
module.lb_gcp.google_compute_health_check.primary: Still destroying... [id=projects/ag-tfe-aa/global/healthChecks/tfe-aa-primary-healthcheck, 10s elapsed]
module.lb_gcp.google_compute_health_check.primary: Destruction complete after 11s
module.compute_templated_gcp.google_compute_region_instance_group_manager.main: Still destroying... [id=projects/ag-tfe-aa/regions/europe-west4...upManagers/tfe-aa-tfe-aa-group-manager, 20s elapsed]
module.compute_templated_gcp.google_compute_region_instance_group_manager.main: Still destroying... [id=projects/ag-tfe-aa/regions/europe-west4...upManagers/tfe-aa-tfe-aa-group-manager, 30s elapsed]
module.compute_templated_gcp.google_compute_region_instance_group_manager.main: Still destroying... [id=projects/ag-tfe-aa/regions/europe-west4...upManagers/tfe-aa-tfe-aa-group-manager, 40s elapsed]
module.compute_templated_gcp.google_compute_region_instance_group_manager.main: Still destroying... [id=projects/ag-tfe-aa/regions/europe-west4...upManagers/tfe-aa-tfe-aa-group-manager, 50s elapsed]
module.compute_templated_gcp.google_compute_region_instance_group_manager.main: Still destroying... [id=projects/ag-tfe-aa/regions/europe-west4...upManagers/tfe-aa-tfe-aa-group-manager, 1m0s elapsed]
module.compute_templated_gcp.google_compute_region_instance_group_manager.main: Still destroying... [id=projects/ag-tfe-aa/regions/europe-west4...upManagers/tfe-aa-tfe-aa-group-manager, 1m10s elapsed]
module.compute_templated_gcp.google_compute_region_instance_group_manager.main: Still destroying... [id=projects/ag-tfe-aa/regions/europe-west4...upManagers/tfe-aa-tfe-aa-group-manager, 1m20s elapsed]
module.compute_templated_gcp.google_compute_region_instance_group_manager.main: Still destroying... [id=projects/ag-tfe-aa/regions/europe-west4...upManagers/tfe-aa-tfe-aa-group-manager, 1m30s elapsed]
module.compute_templated_gcp.google_compute_region_instance_group_manager.main: Still destroying... [id=projects/ag-tfe-aa/regions/europe-west4...upManagers/tfe-aa-tfe-aa-group-manager, 1m40s elapsed]
module.compute_templated_gcp.google_compute_region_instance_group_manager.main: Still destroying... [id=projects/ag-tfe-aa/regions/europe-west4...upManagers/tfe-aa-tfe-aa-group-manager, 1m50s elapsed]
module.compute_templated_gcp.google_compute_region_instance_group_manager.main: Still destroying... [id=projects/ag-tfe-aa/regions/europe-west4...upManagers/tfe-aa-tfe-aa-group-manager, 2m0s elapsed]
module.compute_templated_gcp.google_compute_region_instance_group_manager.main: Destruction complete after 2m6s
module.compute_templated_gcp.google_compute_health_check.tfe-https-health-check: Destroying... [id=projects/ag-tfe-aa/global/healthChecks/tfe-aa-tfe-health-check]
module.compute_templated_gcp.google_compute_instance_template.ptfe_main: Destroying... [id=projects/ag-tfe-aa/global/instanceTemplates/tfe-aa-tfe-template-20210324144744030500000002]
module.compute_templated_gcp.google_compute_health_check.tfe-https-health-check: Still destroying... [id=projects/ag-tfe-aa/global/healthChecks/tfe-aa-tfe-health-check, 10s elapsed]
module.compute_templated_gcp.google_compute_instance_template.ptfe_main: Still destroying... [id=projects/ag-tfe-aa/global/instanceTempl...fe-template-20210324144744030500000002, 10s elapsed]
module.compute_templated_gcp.google_compute_instance_template.ptfe_main: Destruction complete after 11s
random_id.backup_token: Destroying... [id=kUa83XgvCBNANe7myE5hYQ]
random_id.user_token: Destroying... [id=Nal4MFVhDGn2F8AS0TS11g]
random_id.root_secret: Destroying... [id=r7HMoPkNLxNrE_ZgYJEocw]
module.db_gcp.google_sql_database.tfedatabase: Destroying... [id=projects/ag-tfe-aa/instances/tfeaa-top-crawfish/databases/tfeaa-top-crawfish]
random_id.registry_session_secret_key: Destroying... [id=MSqt1K4K-sjXNQVx_8F-jA]
module.objectstorage_gcp.google_service_account_key.tfe_bucket: Destroying... [id=projects/ag-tfe-aa/serviceAccounts/tfe-aa-tfe-bucket@ag-tfe-aa.iam.gserviceaccount.com/keys/a209a4d5149afe65cea7a340a9eb42f372ed5a8e]
random_id.registry_session_secret_key: Destruction complete after 0s
random_id.user_token: Destruction complete after 0s
random_id.root_secret: Destruction complete after 0s
random_id.backup_token: Destruction complete after 0s
random_id.enc_password: Destroying... [id=q0JrMLacUHjyMiKUpelhnQ]
module.redis_gcp.google_redis_instance.redis_gcp: Destroying... [id=projects/ag-tfe-aa/locations/europe-west4/instances/tfe-aa-redis]
module.objectstorage_gcp.google_storage_bucket.tfe: Destroying... [id=tfe-aa-lucky-chamois]
random_id.archivist_token: Destroying... [id=d0k4Loqkf63qSbFK0g1VLQ]
random_password.admin_password: Destroying... [id=none]
random_id.enc_password: Destruction complete after 1s
random_id.archivist_token: Destruction complete after 1s
random_password.admin_password: Destruction complete after 0s
random_id.registry_session_encryption_key: Destroying... [id=SeFDcBch345hkz1N-q8Akg]
random_id.registry_session_encryption_key: Destruction complete after 0s
module.db_gcp.google_sql_user.tfeadmin: Destroying... [id=hashicorp//tfeaa-top-crawfish]
random_id.internal_api_token: Destroying... [id=F0VkkvYII3rsZMvY40p9Vw]
random_id.install_id: Destroying... [id=cOHCglVT0g1Xo2A488suTA]
random_id.install_id: Destruction complete after 0s
random_id.internal_api_token: Destruction complete after 0s
module.config.random_string.replicated_console_password: Destroying... [id=VCqGGJffdcUKT2gaiq4x3C2B]
module.config.random_string.replicated_console_password: Destruction complete after 0s
random_id.cookie_hash: Destroying... [id=NEmO67bsIrfn7-Val2Kgbw]
random_id.cookie_hash: Destruction complete after 0s
module.objectstorage_gcp.google_service_account_key.tfe_bucket: Destruction complete after 1s
module.objectstorage_gcp.google_service_account.tfe_bucket: Destroying... [id=projects/ag-tfe-aa/serviceAccounts/tfe-aa-tfe-bucket@ag-tfe-aa.iam.gserviceaccount.com]
module.objectstorage_gcp.google_storage_bucket.tfe: Destruction complete after 1s
module.objectstorage_gcp.random_pet.bucket_name_suffix: Destroying... [id=lucky-chamois]
module.objectstorage_gcp.random_pet.bucket_name_suffix: Destruction complete after 0s
module.objectstorage_gcp.google_service_account.tfe_bucket: Destruction complete after 1s
module.db_gcp.google_sql_database.tfedatabase: Destruction complete after 2s
module.db_gcp.google_sql_user.tfeadmin: Destruction complete after 4s
module.db_gcp.random_password.password: Destroying... [id=none]
module.db_gcp.random_password.password: Destruction complete after 0s
module.db_gcp.google_sql_database_instance.tfemaster: Destroying... [id=tfeaa-top-crawfish]
module.compute_templated_gcp.google_compute_health_check.tfe-https-health-check: Destruction complete after 16s
module.redis_gcp.google_redis_instance.redis_gcp: Still destroying... [id=projects/ag-tfe-aa/locations/europe-west4/instances/tfe-aa-redis, 10s elapsed]
module.db_gcp.google_sql_database_instance.tfemaster: Still destroying... [id=tfeaa-top-crawfish, 10s elapsed]
module.redis_gcp.google_redis_instance.redis_gcp: Still destroying... [id=projects/ag-tfe-aa/locations/europe-west4/instances/tfe-aa-redis, 20s elapsed]
module.db_gcp.google_sql_database_instance.tfemaster: Still destroying... [id=tfeaa-top-crawfish, 20s elapsed]
module.redis_gcp.google_redis_instance.redis_gcp: Still destroying... [id=projects/ag-tfe-aa/locations/europe-west4/instances/tfe-aa-redis, 30s elapsed]
module.db_gcp.google_sql_database_instance.tfemaster: Still destroying... [id=tfeaa-top-crawfish, 30s elapsed]
module.redis_gcp.google_redis_instance.redis_gcp: Still destroying... [id=projects/ag-tfe-aa/locations/europe-west4/instances/tfe-aa-redis, 40s elapsed]
module.db_gcp.google_sql_database_instance.tfemaster: Still destroying... [id=tfeaa-top-crawfish, 40s elapsed]
module.redis_gcp.google_redis_instance.redis_gcp: Still destroying... [id=projects/ag-tfe-aa/locations/europe-west4/instances/tfe-aa-redis, 50s elapsed]
module.db_gcp.google_sql_database_instance.tfemaster: Still destroying... [id=tfeaa-top-crawfish, 50s elapsed]
module.redis_gcp.google_redis_instance.redis_gcp: Still destroying... [id=projects/ag-tfe-aa/locations/europe-west4/instances/tfe-aa-redis, 1m0s elapsed]
module.db_gcp.google_sql_database_instance.tfemaster: Still destroying... [id=tfeaa-top-crawfish, 1m0s elapsed]
module.redis_gcp.google_redis_instance.redis_gcp: Still destroying... [id=projects/ag-tfe-aa/locations/europe-west4/instances/tfe-aa-redis, 1m10s elapsed]
module.db_gcp.google_sql_database_instance.tfemaster: Still destroying... [id=tfeaa-top-crawfish, 1m10s elapsed]
module.redis_gcp.google_redis_instance.redis_gcp: Still destroying... [id=projects/ag-tfe-aa/locations/europe-west4/instances/tfe-aa-redis, 1m20s elapsed]
module.db_gcp.google_sql_database_instance.tfemaster: Still destroying... [id=tfeaa-top-crawfish, 1m20s elapsed]
module.redis_gcp.google_redis_instance.redis_gcp: Still destroying... [id=projects/ag-tfe-aa/locations/europe-west4/instances/tfe-aa-redis, 1m30s elapsed]
module.db_gcp.google_sql_database_instance.tfemaster: Still destroying... [id=tfeaa-top-crawfish, 1m30s elapsed]
module.redis_gcp.google_redis_instance.redis_gcp: Still destroying... [id=projects/ag-tfe-aa/locations/europe-west4/instances/tfe-aa-redis, 1m40s elapsed]
module.db_gcp.google_sql_database_instance.tfemaster: Still destroying... [id=tfeaa-top-crawfish, 1m40s elapsed]
module.redis_gcp.google_redis_instance.redis_gcp: Destruction complete after 1m47s
module.db_gcp.google_sql_database_instance.tfemaster: Still destroying... [id=tfeaa-top-crawfish, 1m50s elapsed]
module.db_gcp.google_sql_database_instance.tfemaster: Still destroying... [id=tfeaa-top-crawfish, 2m0s elapsed]
module.db_gcp.google_sql_database_instance.tfemaster: Still destroying... [id=tfeaa-top-crawfish, 2m10s elapsed]
module.db_gcp.google_sql_database_instance.tfemaster: Destruction complete after 2m18s
module.db_gcp.random_pet.dbname_suffix: Destroying... [id=top-crawfish]
module.db_gcp.google_service_networking_connection.private_vpc_connection: Destroying... [id=projects%2Fag-tfe-aa%2Fglobal%2Fnetworks%2Ftfe-aa-vpc:servicenetworking.googleapis.com]
module.db_gcp.random_pet.dbname_suffix: Destruction complete after 0s
module.db_gcp.google_service_networking_connection.private_vpc_connection: Still destroying... [id=projects%2Fag-tfe-aa%2Fglobal%2Fnetwork...a-vpc:servicenetworking.googleapis.com, 10s elapsed]
module.db_gcp.google_service_networking_connection.private_vpc_connection: Still destroying... [id=projects%2Fag-tfe-aa%2Fglobal%2Fnetwork...a-vpc:servicenetworking.googleapis.com, 20s elapsed]
module.db_gcp.google_service_networking_connection.private_vpc_connection: Destruction complete after 23s
module.db_gcp.google_compute_global_address.private_ip_address: Destroying... [id=projects/ag-tfe-aa/global/addresses/tfe-aa-private-ip-address]
module.db_gcp.google_compute_global_address.private_ip_address: Still destroying... [id=projects/ag-tfe-aa/global/addresses/tfe-aa-private-ip-address, 10s elapsed]
module.db_gcp.google_compute_global_address.private_ip_address: Destruction complete after 11s
module.network_gcp.google_compute_subnetwork.tfe_subnet: Destroying... [id=projects/ag-tfe-aa/regions/europe-west4/subnetworks/tfe-aa-subnet]
module.network_gcp.google_compute_subnetwork.tfe_subnet: Still destroying... [id=projects/ag-tfe-aa/regions/europe-west4/subnetworks/tfe-aa-subnet, 10s elapsed]
module.network_gcp.google_compute_subnetwork.tfe_subnet: Still destroying... [id=projects/ag-tfe-aa/regions/europe-west4/subnetworks/tfe-aa-subnet, 20s elapsed]
module.network_gcp.google_compute_subnetwork.tfe_subnet: Still destroying... [id=projects/ag-tfe-aa/regions/europe-west4/subnetworks/tfe-aa-subnet, 30s elapsed]
module.network_gcp.google_compute_subnetwork.tfe_subnet: Destruction complete after 33s
module.network_gcp.google_compute_network.tfe_vpc: Destroying... [id=projects/ag-tfe-aa/global/networks/tfe-aa-vpc]
module.network_gcp.google_compute_network.tfe_vpc: Still destroying... [id=projects/ag-tfe-aa/global/networks/tfe-aa-vpc, 10s elapsed]
module.network_gcp.google_compute_network.tfe_vpc: Still destroying... [id=projects/ag-tfe-aa/global/networks/tfe-aa-vpc, 20s elapsed]
module.network_gcp.google_compute_network.tfe_vpc: Still destroying... [id=projects/ag-tfe-aa/global/networks/tfe-aa-vpc, 30s elapsed]
module.network_gcp.google_compute_network.tfe_vpc: Destruction complete after 37s

Warning: Interpolation-only expressions are deprecated

  on modules/compute_templated_gcp/main.tf line 100, in resource "google_compute_instance_template" "ptfe_main":
 100:     ssh-keys           = "ubuntu:${file("${var.public_key_path}")}" // ?

Terraform 0.11 and earlier required all non-constant expressions to be
provided via interpolation syntax, but this pattern is now deprecated. To
silence this warning, remove the "${ sequence from the start and the }"
sequence from the end of this expression, leaving just the inner expression.

Template interpolation syntax is still used to construct strings from
expressions when the template includes multiple interpolation sequences or a
mixture of literal strings and interpolations. This deprecation applies only
to templates that consist entirely of a single interpolation sequence.


Destroy complete! Resources: 50 destroyed.
```
