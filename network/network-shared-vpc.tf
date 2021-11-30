#
# Shared VPCs
#

module "shared_vpc" {
  for_each = var.shared_vpcs

  source  = "terraform-google-modules/network/google"
  version = "~> 4.0" # local.google_network_version

  project_id   = each.value.project_id
  network_name = each.value.name
  routing_mode = "GLOBAL"

  subnets          = each.value.subnets == null ? [] : each.value.subnets
  secondary_ranges = each.value.secondary_ranges == null ? {} : each.value.secondary_ranges
  routes           = each.value.routes == null ? [] : each.value.routes
  shared_vpc_host  = each.value.shared_vpc_host != false ? true : false
}
