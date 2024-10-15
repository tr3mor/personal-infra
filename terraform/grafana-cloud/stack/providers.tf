terraform {
  required_version = ">= 1.3"
  cloud {
    organization = "tr3mor"

    workspaces {
      name = "grafana-cloud-stack"
    }
  }
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "3.10.0"
    }
  }
}

provider "grafana" {
  cloud_access_policy_token = var.cloud_api_key
}
