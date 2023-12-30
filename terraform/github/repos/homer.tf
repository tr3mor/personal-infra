module "homer" {
  source = "../../../terraform-modules/github/github-repo"

  name      = "homer"
  auto_init = true
}
