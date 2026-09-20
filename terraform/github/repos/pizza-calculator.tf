module "pizza-calculator" {
  source = "../../../terraform-modules/github/github-repo"

  name             = "pizza-calculator"
  auto_init        = true
  pages_enabled    = true
  pages_build_type = "workflow"

  required_status_checks = [
    "build", # ci.yml, runs npm ci && npm run build on every PR
  ]
}
