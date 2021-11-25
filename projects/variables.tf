#
# Configuration variables
#

#
# Project details
#


variable "projects" {
  description = "Project details"
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
# Shared VPC Host projects
#

variable "shared_vpc_projects" {
  description = "Project IDs for Shared VPC hosts"
  type        = map(string)
  default     = {}
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
    "project-factory" = "~> 12.2",
  }
}

variable "default_apis" {
  description = "Default GCP APIs to enable"
  type        = list(string)
  default     = []
}

variable "default_project_labels" {
  description = "Default project labels"
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
