/* TFE requirements :
CREATE SCHEMA rails;
CREATE SCHEMA vault;
CREATE SCHEMA registry;
*/
variable "db_schemas" {
  type    = list(string)
  default = ["rails", "vault", "registry"]
}

/* TFE requirements :
CREATE EXTENSION IF NOT EXISTS "hstore" WITH SCHEMA "rails";
CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA "rails";
CREATE EXTENSION IF NOT EXISTS "citext" WITH SCHEMA "registry";
*/
variable "db_extensions_map" {
  default = {
    "hstore" : "rails",
    "uuid-ossp" : "rails",
    "citext" : "registry"
  }
}


variable "db_version" {
  # GCS-notation Postgre engine version 
  # https://cloud.google.com/sql/docs/postgres/admin-api/rest/v1beta4/SqlDatabaseVersion
  # 
  # For modern TFE (  September 2022+ ) is should be PG 12
  # POSTGRES_12
  # in future it can be POSTGRES_14
  default = ""
}

variable "name" {
  type        = string
  description = "Name for DB and tags and etc"
}

variable "username" {
  type        = string
  description = "Name for Master DB user"
}

variable "region" {
  type        = string
  description = "Region for DB"
  # No default!!
}


variable "network_id" {
  type        = string
  description = "ID of network to use"
}

variable "tier" {
  type        = string
  description = "GCP DB tier"
  default     = "db-custom-2-7680"
}