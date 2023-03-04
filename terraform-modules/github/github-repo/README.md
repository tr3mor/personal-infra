<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | ~> 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_branch_default.branch](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_default) | resource |
| [github_issue_label.actions](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/issue_label) | resource |
| [github_issue_label.ansible](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/issue_label) | resource |
| [github_issue_label.dependencies](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/issue_label) | resource |
| [github_issue_label.docker](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/issue_label) | resource |
| [github_issue_label.go](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/issue_label) | resource |
| [github_issue_label.terraform](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/issue_label) | resource |
| [github_repository.repo](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | Description of the repository | `string` | `""` | no |
| <a name="input_homepage_url"></a> [homepage\_url](#input\_homepage\_url) | Homepage url for the project | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the repository | `string` | n/a | yes |
| <a name="input_pages_cname"></a> [pages\_cname](#input\_pages\_cname) | The custom domain for the repository | `string` | `null` | no |
| <a name="input_pages_enabled"></a> [pages\_enabled](#input\_pages\_enabled) | Enable Github Pages for the repo | `bool` | `false` | no |
| <a name="input_pages_path"></a> [pages\_path](#input\_pages\_path) | The repository directory from which the site publishes | `string` | `"/"` | no |
| <a name="input_topics"></a> [topics](#input\_topics) | List of repo topics | `list(string)` | `null` | no |
| <a name="input_visibility"></a> [visibility](#input\_visibility) | Repo visibility level | `string` | `"public"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->