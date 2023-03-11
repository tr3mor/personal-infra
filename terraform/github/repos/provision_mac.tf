module "provision_mac" {
  source = "../../../terraform-modules/github/github-repo"

  name        = "provision_mac"
  description = "Ansible playbook to provision my macbook"
}