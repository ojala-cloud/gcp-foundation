#
# GCP Foundation
#

#
# GCP Environment
#

variable "gcp_default_terraform_project" {
  description = "Default project for GCP Foundation Terraform storage"
  type        = string
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

variable "common_prefix" {
  description = "Prefix for common resources"
  type        = string
}