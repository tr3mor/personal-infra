<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | >= 0.40.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | >= 0.40.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tfe_notification_configuration.terraform](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/notification_configuration) | resource |
| [tfe_variable_set.varset](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable_set) | resource |
| [tfe_workspace.tfe](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace) | resource |
| [tfe_workspace_variable_set.ws-varset](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace_variable_set) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_apply"></a> [auto\_apply](#input\_auto\_apply) | Enable autoapply for workspace | `bool` | `true` | no |
| <a name="input_create_variable_set"></a> [create\_variable\_set](#input\_create\_variable\_set) | Whether variable set should be created for this workspace | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | A description for the workspace | `string` | `""` | no |
| <a name="input_execution_mode"></a> [execution\_mode](#input\_execution\_mode) | Execution mode for workspace | `string` | `"remote"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the workspace | `string` | n/a | yes |
| <a name="input_notification_email_user_ids"></a> [notification\_email\_user\_ids](#input\_notification\_email\_user\_ids) | List of emails to send notifications to | `list(string)` | n/a | yes |
| <a name="input_notification_enabled"></a> [notification\_enabled](#input\_notification\_enabled) | Whether email notification should be enabled for this workspace | `bool` | `true` | no |
| <a name="input_oauth_token_id"></a> [oauth\_token\_id](#input\_oauth\_token\_id) | The VCS Connection to use. This ID can be obtained from a tfe\_oauth\_client resource. | `string` | n/a | yes |
| <a name="input_org_name"></a> [org\_name](#input\_org\_name) | Organization ID in which workspace should be created | `string` | n/a | yes |
| <a name="input_terraform_version"></a> [terraform\_version](#input\_terraform\_version) | Terraform version to use for workspace runs | `string` | `"latest"` | no |
| <a name="input_trigger_patterns"></a> [trigger\_patterns](#input\_trigger\_patterns) | List of glob patterns that describe the files Terraform Cloud monitors for changes | `list(string)` | `null` | no |
| <a name="input_vcs_repo_branch"></a> [vcs\_repo\_branch](#input\_vcs\_repo\_branch) | Github branch to watch | `string` | `"main"` | no |
| <a name="input_vcs_repo_identifier"></a> [vcs\_repo\_identifier](#input\_vcs\_repo\_identifier) | Github repo identifier | `string` | n/a | yes |
| <a name="input_working_directory"></a> [working\_directory](#input\_working\_directory) | Github repo dir to watch | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->