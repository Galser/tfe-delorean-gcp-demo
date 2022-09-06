# VARIABLES
# We putting them here as we want to have ON code file for thw hole test
# ---


# Variables
variable "hostname" {
  default = "tfescaletest.guselietov.com"
}

variable "org" {
  default = "zoo"
}

variable "oauth_token" {
  default     = "ot-j1r26pGwcFVY2fb4"
  description = "OAuth token from the VCS provider settings in TFE"
}

variable "repo_identifier" {
  default = "Galser/tf-large-state-generator-a"
}

variable "agent_pool_id" {
  default = "apool-ri4EgLfzTStjGMJX"
}


resource "random_pet" "workspace" {}

# LOCALS
locals {
  workspace_to_create = random_pet.workspace.id
  resources_count     = 100
  agent_pool_id = var.agent_pool_id
}

provider "tfe" {
  hostname = var.hostname
  #  token    = var.token. --> oinly if we really want it
  #  for the test we assume it is coming from TFE_TOKEN env var
  #  version  = "~> 0.15.0"
}

# RESOURCES 

# Creating workspace(s) 1 
resource "tfe_workspace" "ws-test-main" {
  count = local.resources_count
  #   name         = ${local.workspace_to_create} + "_"+"${count.index}"
	agent_pool_id  =  local.agent_pool_id
  name           = format("%s_%03d", local.workspace_to_create, count.index)
  organization   = var.org
  auto_apply     = true
  queue_all_runs = true
  execution_mode = "agent" # "remote" # agent
  vcs_repo {
    identifier         = var.repo_identifier
    ingress_submodules = false
    oauth_token_id     = var.oauth_token
  }
}