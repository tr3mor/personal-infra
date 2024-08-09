terraform {
  required_version = ">= 1.3"
  cloud {
    organization = "tr3mor"

    workspaces {
      name = "tf-cloud-workspaces"
    }
  }
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.58.0"
    }
  }
}

provider "tfe" {}
