#
# Code and workflow sections
#

variable "section" {
  description = "Terraform and workflow sections"
  #
  type = map(object({
    description        = optional(string)
    name               = optional(string)
    directory          = optional(string)
    features           = optional(map(bool))
    terraform_version  = optional(string)
    terraform_project  = optional(string)
    template_file      = optional(string)
    google_credentials = optional(string)
    workflow_enabled   = optional(bool)
    # 
    # IAM Bindings
    #
    organization_roles = optional(list(string))
    folder_roles       = optional(map(list(string)))
    project_roles      = optional(map(list(string)))
    })
  )
  default = {}
}
