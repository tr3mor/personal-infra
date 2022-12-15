module "tfe_workspace" {
  source = "../../../terraform-modules/tf-cloud/tf-cloud-workspace"

  name        = "grafana-cloud-stack"
  description = "Workspace to manage stack in Grafana Cloud"
  org_name    = tfe_organization.tr3mor.name

  working_directory   = "terraform/grafana-cloud/stack"
  vcs_repo_identifier = "tr3mor/personal-infra"
  oauth_token_id      = tfe_oauth_client.github.oauth_token_id

  notification_email_user_ids = [data.tfe_organization_membership.admin.user_id]
  create_variable_set         = true
}
