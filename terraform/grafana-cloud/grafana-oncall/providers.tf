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
      version = "1.32.0"
    }
  }
}