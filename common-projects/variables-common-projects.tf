#
# Common Project details
#

variable "projects" {
  description = "Common project details"
  type = map(object({
    name              = string
    id                = string
    folder            = optional(string)
    random_project_id = optional(bool)
    billing_account   = optional(string)
    apis              = optional(list(string))
    labels            = optional(map(string))
  }))
  default = {}
}
