variable "grafana_oncall_token" {
  type        = string
  sensitive   = true
  description = "Grafana On-call token (different from general Grafana token)"
}
