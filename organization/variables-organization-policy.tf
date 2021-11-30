#
# Organization Policy assignments
#

variable "organization_policies" {
  description = "Organization Policy assignments"
  type = list(object({
    policy       = string
    enforce      = optional(string)
    organization = optional(bool)
    folder_ids   = optional(list(string))
    project_ids  = optional(list(string))
  }))
  default = []
}
