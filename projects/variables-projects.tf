#
# Heroku projects
#

variable "heroku_projects" {
  description = "Heroku Project details"
  type = map(object({
    name              = string
    id                = string
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

#
# Demo K-Ruoka projects
#

variable "kruoka_projects" {
  description = "K-Ruoka Project details"
  type = map(object({
    name              = string
    id                = string
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
