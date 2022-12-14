variable "name" {
  type        = string
  description = "Name of the workspace"
}


variable "description" {
  type        = string
  default     = ""
  description = "A description for the workspace"
}

variable "org_name" {
  type        = string
  description = "Organization ID in which workspace should be created"
}

variable "terraform_version" {
  type        = string
  default     = "latest"
  description = "Terraform version to use for workspace runs"
}

variable "working_directory" {
  type        = string
  description = "Github repo dir to watch"
}

variable "auto_apply" {
  type        = bool
  default     = true
  description = "Enable autoapply for workspace"
}

variable "execution_mode" {
  type        = string
  default     = "remote"
  description = "Execution mode for workspace"
}

variable "vcs_repo_identifier" {
  type        = string
  description = "Github repo identifier"
}

variable "vcs_repo_branch" {
  type        = string
  default     = "main"
  description = "Github branch to watch"
}

variable "oauth_token_id" {
  type        = string
  description = "The VCS Connection to use. This ID can be obtained from a tfe_oauth_client resource."
}

variable "trigger_patterns" {
  type        = list(string)
  default     = []
  description = "List of glob patterns that describe the files Terraform Cloud monitors for changes"
}

variable "notification_enabled" {
  type        = bool
  default     = true
  description = "Whether email notification should be enabled for this workspace"
}

variable "notification_email_user_ids" {
  type        = list(string)
  description = "List of emails to send notifications to"
}
