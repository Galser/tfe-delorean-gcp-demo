output "postgres_config" {
  value = {
    netloc       = google_sql_database_instance.tfemaster.private_ip_address
    dbname       = google_sql_database.tfedatabase.name
    user         = google_sql_user.tfeadmin.name
    password     = google_sql_user.tfeadmin.password
    extra_params = "sslmode=require"
  }
}