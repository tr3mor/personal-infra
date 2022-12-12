terraform {
  cloud {
    organization = "tr3mor"

    workspaces {
      name = "tf-cloud"
    }
  }
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.40.0"
    }
  }
}

provider "tfe" {
}
