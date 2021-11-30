#
# Configuration variables
#

#
# Development environment
#

variable "gcp_default_region" {
  description = "Default GCP Region"
  type        = string
  default     = "europe-north1"
}

variable "gcp_organization_id" {
  description = "GCP Organization ID"
  type        = string
}
