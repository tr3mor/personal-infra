variable "org_id" {
  type = string
}

variable "name" {
  type = string

}
variable "terraform_version" {
  type    = string
  default = "latest"

}
variable "working_directory" {
  type = string

}
variable "auto_apply" {
  type    = bool
  default = true
}

variable "execution_mode" {
  type    = string
  default = "remote"

}
variable "vcs_repo_identifier" {
  type = string
}

variable "vcs_repo_branch" {
  type    = string
  default = "main"
}

variable "oauth_token_id" {
  type = string

}
variable "notification_enabled" {
  type    = bool
  default = true
}
variable "notification_email_user_ids" {
  type = list(string)

}

variable "trigger_patterns" {
  type    = list(string)
  default = []
}