#
# Configuration variables
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
    terraform_project = optional(string)
    template_file      = optional(string)
    google_credentials = optional(string)
    workflow_enabled   = optional(bool)
    })
  )
  default = {}
}

variable "gcp_default_terraform_project" {
    description = "Default project for GCP Foundation Terraform storage"
    type = string
}

variable "gcp_default_region" {
    description = "Default GCP Region"
    type = string
    default = "europe-north1"
}

variable "gcp_organization_id" {
  description = "GCP Organization ID"
  type        = string
}

variable "common_prefix" {
  description = "Prefix for common resources"
  type        = string
}