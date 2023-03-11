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
      version = "1.36.1"
    }
  }
}

provider "grafana" {
  cloud_api_key = var.cloud_api_key
}
