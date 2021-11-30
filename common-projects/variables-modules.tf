#
# Module versions in use
#

variable "module_versions" {
  description = "Required versions for modules"
  type        = map(string)
  default = {
    "google-network"  = "~> 4.0",
    "project-factory" = "~> 11.2",
  }
}
