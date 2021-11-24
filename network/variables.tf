#
# Configuration variables
#

#
# Shared VPC details
#


variable "shared_vpcs" {
  description = "Shared VPC details"
  type = map(object({
    name            = string
    project_id      = string
    shared_vpc_host = optional(bool) # Default true
    subnets         = optional(list(map(string)))
    secondary_ranges = optional(map(
      list(
        object({
          range_name    = string,
          ip_cidr_range = string,
        })
      )
    ))
    routes = optional(list(map(string)))
  }))
  default = {}
}

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
