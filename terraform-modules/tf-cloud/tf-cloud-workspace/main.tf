resource "tfe_workspace" "tfe" {
  name         = var.name
  description  = var.description
  organization = var.org_name

  terraform_version     = var.terraform_version
  working_directory     = var.working_directory
  execution_mode        = var.execution_mode
  auto_apply            = var.auto_apply
  queue_all_runs        = true
  allow_destroy_plan    = false
  file_triggers_enabled = true

  vcs_repo {
    identifier     = var.vcs_repo_identifier
    branch         = var.vcs_repo_branch
    oauth_token_id = var.oauth_token_id
  }

  trigger_patterns = var.trigger_patterns
}

resource "tfe_notification_configuration" "terraform" {
  count        = var.notification_enabled ? 1 : 0
  name         = "${var.name}-notification"
  enabled      = var.notification_enabled
  workspace_id = tfe_workspace.tfe.id

  destination_type = "email"
  email_user_ids   = var.notification_email_user_ids
  triggers = [
    "run:errored",
    "run:needs_attention",
  ]
}

resource "tfe_variable_set" "varset" {
  count        = var.create_variable_set ? 1 : 0
  name         = "${var.name}-variable-set"
  description  = "Variable set for ${var.name} workspace"
  organization = var.org_name
}

resource "tfe_workspace_variable_set" "ws_varset" {
  count           = var.create_variable_set ? 1 : 0
  variable_set_id = tfe_variable_set.varset[0].id
  workspace_id    = tfe_workspace.tfe.id
}
