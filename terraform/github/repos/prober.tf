module "prober" {
  source = "../../../terraform-modules/github/github-repo"

  name        = "prober"
  description = "Simple prober codebase which could be easily extended with any custom probes"
}
