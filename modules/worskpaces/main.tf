# VARIABLES
# We putting them here as we want to have ON code file for thw hole test
# ---


# Variables

# GitHub repo fro testing
variable "repo_identifier" {
  default = "Galser/tf-large-state-generator-a"
}


resource "random_pet" "org" {}

resource "random_pet" "workspace" {}

# LOCALS
locals {
  organization_name   = random_pet.org.id
  workspace_to_create = random_pet.workspace.id
  resources_count     = var.workspace_count
}

provider "tfe" {
  hostname = var.tfe_hostname
  #  token    = var.token. --> oinly if we really want it
  #  for the test we assume it is coming from TFE_TOKEN env var
  #  version  = "~> 0.15.0"
}

# RESOURCES 

resource "tfe_organization" "test" {
  name  = local.organization_name
  email = var.admin_email
}

resource "tfe_oauth_client" "github" {
  name             = "github-oauth-client"
  organization     = tfe_organization.test.id
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.github_auth_token
  service_provider = "github"
}


# Creating workspace(s) 1 
resource "tfe_workspace" "ws-test-main" {
  count = local.resources_count
  #   name         = ${local.workspace_to_create} + "_"+"${count.index}"
  # agent_pool_id  = local.agent_pool_id 
  name           = format("%s_%03d", local.workspace_to_create, count.index)
  organization   = tfe_organization.test.id
  auto_apply     = true
  queue_all_runs = true
  execution_mode = "remote" # "remote" # agent
  vcs_repo {
    identifier         = var.repo_identifier
    ingress_submodules = false
    oauth_token_id     = tfe_oauth_client.github.oauth_token_id
  }
}
