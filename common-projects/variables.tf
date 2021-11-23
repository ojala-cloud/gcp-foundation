#
# Configuration variables
#

#
# Project details
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

#
# Folder structure
#

variable "existing_folders" {
  description = "List of existing folders"
  type        = list(string)
  default     = []
}

variable "folders" {
  description = "New folders"
  type        = list(string)
  default     = []
}

#

variable "module_versions" {
  description = "Required versions for modules"
  type        = map(string)
  default = {
    "project-factory" = "~> 11.2",
  }
}

variable "default_apis" {
  description = "Default GCP APIs to enable"
  type        = list(string)
  default     = []
}

variable "default_common_project_labels" {
  description = "Default Common project labels"
  type        = map(string)
  default     = {}
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

variable "gcp_default_billing_account" {
  description = "GCP Billing account"
  type        = string
}

variable "common_prefix" {
  description = "Prefix for common resources"
  type        = string
}