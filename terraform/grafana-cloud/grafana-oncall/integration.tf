resource "grafana_oncall_escalation_chain" "default" {
  name = "default"
}

data "grafana_oncall_user" "tr3mor" {
  username = "tr3mor"
}

resource "grafana_oncall_escalation" "notify-user" {
  escalation_chain_id = grafana_oncall_escalation_chain.default.id
  type                = "notify_persons"
  persons_to_notify = [
    data.grafana_oncall_user.tr3mor.id
  ]
  position = 0
}

resource "grafana_oncall_integration" "integration" {
  name = "default-integration"
  type = "grafana_alerting"
  default_route {
    escalation_chain_id = grafana_oncall_escalation_chain.default.id
  }
}
