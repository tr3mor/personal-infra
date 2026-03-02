variable "name" {
  type        = string
  description = "Name of the repository"
}

variable "description" {
  type        = string
  description = "Description of the repository"
  default     = ""
}

variable "homepage_url" {
  type        = string
  description = "Homepage url for the project"
  default     = ""
}

variable "visibility" {
  type        = string
  description = "Repo visibility level"
  default     = "public"
  validation {
    condition     = contains(["public", "private"], var.visibility)
    error_message = "Visibility level should be \"private\" or \"public\""
  }
}

variable "topics" {
  type        = list(string)
  description = "List of repo topics"
  default     = null
}

variable "pages_enabled" {
  type        = bool
  description = "Enable Github Pages for the repo"
  default     = false
}

variable "pages_build_type" {
  type        = string
  description = "The type of GitHub Pages build. Can be 'legacy' or 'workflow'"
  default     = "legacy"
  validation {
    condition     = contains(["legacy", "workflow"], var.pages_build_type)
    error_message = "pages_build_type must be 'legacy' or 'workflow'"
  }
}

variable "pages_path" {
  type        = string
  description = "The repository directory from which the site publishes"
  default     = "/"
}

variable "pages_cname" {
  type        = string
  description = "The custom domain for the repository"
  default     = null
}

variable "auto_init" {
  type        = bool
  description = "Produce an initial commit in the repository"
  default     = false
}
