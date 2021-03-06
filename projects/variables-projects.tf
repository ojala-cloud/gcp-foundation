#
# Heroku projects
#

variable "heroku_projects" {
  description = "Heroku Project details"
  type = map(object({
    name              = string
    id                = string
    project_group     = optional(string)
    folder            = optional(string)
    random_project_id = optional(bool)
    billing_account   = optional(string)
    apis              = optional(list(string))
    labels            = optional(map(string))
    shared_vpcs = optional(object({
      project = string
      subnets = list(object({
        region = string
        subnet = string
      }))
    }))
  }))
  default = {}
}
