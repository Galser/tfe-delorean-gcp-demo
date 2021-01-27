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