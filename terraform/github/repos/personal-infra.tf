module "personal-infra" {
  source = "../../../terraform-modules/github/github-repo"

  name        = "personal-infra"
  description = "This repo implements GitOps approach to manage my personal infra"

  required_status_checks = [
    "gomod_testing", # gomod-testing.yml, covered on every PR by the dummy.yml companion
  ]
}
