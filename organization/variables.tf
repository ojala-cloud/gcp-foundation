#
# Configuration variables
#

variable "folder_policies" {
  description = "Organization Policy definitions for folders"
  type = list(object({
    folder_name = optional(string)
    folder_id   = string
    policies = list(object({
      policy  = string
      enforce = optional(bool)
    }))
  }))
  default = []
}

#

variable "module_versions" {
  description = "Required versions for modules"
  type        = map(string)
  default = {
    "project-factory" = "~> 12.2",
  }
}

variable "gcp_default_region" {
  description = "Default GCP Region"
  type        = string
  default     = "europe-north1"
}

variable "gcp_organization_id" {
  description = "GCP Organization ID"
  type        = string
}
