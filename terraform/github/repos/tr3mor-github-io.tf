module "tr3mor-github-io" {
  source = "../../../terraform-modules/github/github-repo"

  name          = "tr3mor.github.io"
  auto_init     = true
  pages_enabled = true
}
