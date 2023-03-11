module "clip2decode" {
  source = "../../../terraform-modules/github/github-repo"

  name        = "clip2decode"
  description = "Simple tool to decode base64 from your clipboard, print it and store it back decoded"
}
