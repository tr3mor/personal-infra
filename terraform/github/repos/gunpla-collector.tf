module "gunpla-collector" {
  source = "../../../terraform-modules/github/github-repo"

  name        = "gunpla-collector"
  description = "Tracks Gunpla model kit inventory and prices at online shops over time, and sends a daily Telegram summary of what's new, removed, or changed price"
}
