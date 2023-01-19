variable "github_auth_token" {
  default     = ""
  description = "Add your GitHub auth token via env vars or in any other way"
}

variable "tfe_hostname" {
  default     = "tfescaletest.guselietov.com"
  description = "Host of TFE"
}

variable "admin_email" {
  description = "TFE Admin email"
}

variable "workspace_count" {
  default     = 100
  description = "Number of workspaces to create"
}

/* variable "tfe_token" {
  description = "TFE user-level token"
}
*/

