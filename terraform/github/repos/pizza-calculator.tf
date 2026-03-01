module "pizza-calculator" {
  source = "../../../terraform-modules/github/github-repo"

  name          = "pizza-calculator"
  auto_init     = true
  pages_enabled = true
}
