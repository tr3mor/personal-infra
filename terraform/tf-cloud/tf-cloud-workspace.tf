module "tfe_workspace" {
  source = "../../terraform-modules/tf-cloud/tf-cloud-workspace"

  name        = "tf-cloud"
  description = "Workspace to manage Terraform cloud itself"
  org_id      = tfe_organization.tr3mor.id

  working_directory           = "terraform/tf-cloud"
  vcs_repo_identifier         = "tr3mor/personal-infra"
  oauth_token_id              = tfe_oauth_client.github.oauth_token_id
  notification_email_user_ids = [data.tfe_organization_membership.admin.user_id]
}
