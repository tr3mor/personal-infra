module "gunpla-collector" {
  source = "../../../terraform-modules/github/github-repo"

  name        = "gunpla-collector"
  description = "Tracks Gunpla model kit inventory and prices at online shops over time, and sends a daily Telegram summary of what's new, removed, or changed price"

  required_status_checks = [
    "test", # ci.yml, runs go vet, go test -race and golangci-lint on every PR
  ]
}
