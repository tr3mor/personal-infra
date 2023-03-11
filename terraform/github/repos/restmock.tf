module "restmock" {
  source = "../../../terraform-modules/github/github-repo"

  name        = "restmock"
  description = "Simplest way to mock http response. Pretty useful to troubleshoot Ingress/Istio and other routing issues. It logs all available information to simplify troubleshooting"
}
