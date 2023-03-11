resource "github_repository" "repo" {
  name         = var.name
  description  = var.description
  homepage_url = var.homepage_url

  visibility = var.visibility

  has_wiki             = false
  has_issues           = true
  has_projects         = false
  has_discussions      = false
  has_downloads        = true
  vulnerability_alerts = true

  allow_auto_merge       = true
  allow_merge_commit     = true
  allow_squash_merge     = true
  allow_rebase_merge     = true
  allow_update_branch    = true
  delete_branch_on_merge = true


  is_template = false
  auto_init   = var.auto_init

  topics = var.topics

  dynamic "pages" {
    for_each = var.pages_enabled ? [true] : []
    content {
      source {
        branch = "main"
        path   = var.pages_path
      }
      cname = var.pages_cname
    }
  }
}

resource "github_branch_default" "branch" {
  repository = github_repository.repo.name
  branch     = "main"
}

resource "github_issue_label" "actions" {
  repository = github_repository.repo.name

  name        = "actions"
  color       = "102F5F"
  description = "Pull requests that update actions"
}

resource "github_issue_label" "ansible" {
  repository = github_repository.repo.name

  name        = "ansible"
  color       = "000000"
  description = "Pull requests that update ansible"
}

resource "github_issue_label" "dependencies" {
  repository = github_repository.repo.name

  name        = "dependencies"
  color       = "0366D6"
  description = "Pull requests that update dependencies"
}

resource "github_issue_label" "docker" {
  repository = github_repository.repo.name

  name        = "docker"
  color       = "3E92DC"
  description = "Pull requests that update docker"
}

resource "github_issue_label" "go" {
  repository = github_repository.repo.name

  name        = "golang"
  color       = "4CABD3"
  description = "Pull requests that update go code"
}

resource "github_issue_label" "terraform" {
  repository = github_repository.repo.name

  name        = "terraform"
  color       = "5C44DB"
  description = "Pull requests that update terraform"
}
