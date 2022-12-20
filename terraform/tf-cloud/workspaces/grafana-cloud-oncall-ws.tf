module "grafana_oncall_tfe_workspace" {
  source = "../../../terraform-modules/tf-cloud/tf-cloud-workspace"

  name        = "grafana-cloud-oncall"
  description = "Workspace to manage Grafana Oncall in Grafana Cloud"
  org_name    = tfe_organization.tr3mor.name

  working_directory   = "terraform/grafana-cloud/grafana-oncall"
  vcs_repo_identifier = "tr3mor/personal-infra"
  oauth_token_id      = tfe_oauth_client.github.oauth_token_id

  notification_email_user_ids = [data.tfe_organization_membership.admin.user_id]
}
