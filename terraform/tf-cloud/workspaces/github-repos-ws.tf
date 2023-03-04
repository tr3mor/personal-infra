module "github_repos_tfe_workspace" {
  source = "../../../terraform-modules/tf-cloud/tf-cloud-workspace"

  name        = "github-repos"
  description = "Workspace to manage personal Github repos"
  org_name    = tfe_organization.tr3mor.name

  working_directory   = "terraform/github/repos"
  vcs_repo_identifier = "tr3mor/personal-infra"
  oauth_token_id      = tfe_oauth_client.github.oauth_token_id

  trigger_patterns = ["terraform-modules/github/github-repo/*", "terraform/github/repos/*"]

  notification_email_user_ids = [data.tfe_organization_membership.admin.user_id]
  create_variable_set         = true
}
