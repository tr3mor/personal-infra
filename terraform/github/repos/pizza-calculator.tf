module "pizza-calculator" {
  source = "../../../terraform-modules/github/github-repo"

  name             = "pizza-calculator"
  description      = "Pizza dough calculator based on baker's percentages: set doughball weight, count and hydration to get a full poolish and main dough recipe (Neapolitan, New York)"
  homepage_url     = "https://tr3mor.github.io/pizza-calculator/"
  auto_init        = true
  pages_enabled    = true
  pages_build_type = "workflow"

  required_status_checks = [
    "build", # ci.yml, runs npm ci && npm run build on every PR
  ]
}
