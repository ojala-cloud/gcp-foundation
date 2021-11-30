#
# Configuration variables
#

#
# GCP Environment
#

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
