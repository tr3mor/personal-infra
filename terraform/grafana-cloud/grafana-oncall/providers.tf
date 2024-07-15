terraform {
  required_version = ">= 1.3"
  cloud {
    organization = "tr3mor"

    workspaces {
      name = "grafana-cloud-oncall"
    }
  }
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "3.3.0"
    }
  }
}
provider "grafana" {
  oncall_access_token = var.grafana_oncall_token
}
