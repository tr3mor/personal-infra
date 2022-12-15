locals {
  org_name = "tr3mor"
  email    = "storozhenkopf@gmail.com"
}

resource "tfe_organization" "tr3mor" {
  name  = local.org_name
  email = local.email

  collaborator_auth_policy = "two_factor_mandatory"
}

resource "tfe_oauth_client" "github" {
  name             = "github-client"
  organization     = local.org_name
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.github_oauth_token
  service_provider = "github"
}

resource "tfe_variable_set" "global" {
  name         = "global_varset"
  description  = "Global varset for all workspaces"
  global       = true
  organization = tfe_organization.tr3mor.name
}

data "tfe_organization_membership" "admin" {
  organization = local.org_name
  email        = local.email
}