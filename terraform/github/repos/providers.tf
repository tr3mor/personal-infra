terraform {
  required_version = ">= 1.3"
  cloud {
    organization = "tr3mor"

    workspaces {
      name = "github-repos"
    }
  }
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}
