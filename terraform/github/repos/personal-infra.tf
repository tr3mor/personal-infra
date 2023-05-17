module "personal-infra" {
  source = "../../../terraform-modules/github/github-repo"

  name        = "personal-infra"
  description = "This repo implements GitOps approach to manage my personal infra"
}
