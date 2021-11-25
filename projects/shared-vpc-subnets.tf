#
# Collect information about shared VPC subnets
#

locals {
  shared_vpc_subnets = {
    for name, project in var.projects : name => flatten([
      for subnet in project.shared_vpcs == null ? [] : lookup(project.shared_vpcs, "subnets", []) : {
        index        = join("_", [project.shared_vpcs.project, subnet.region, subnet.subnet])
        project_name = name
        host_project = project.shared_vpcs.project
        region       = subnet.region
        subnet       = subnet.subnet
      }
    ])
  }

  /*
  shared_vpc_subnets_list = flatten([
    for project, subnets in local.shared_vpc_subnets : [
      for subnet in subnets : subnet
    ]
  ])
*/
}

output "shared_vpc_subnets" {
  value = local.shared_vpc_subnets
}

/*
data "google_compute_subnetwork" "shared_vpc_subnet" {
  for_each = {
      for subnet in local.shared_vpc_subnets_list : subnet.index => subnet
  }

  name    = each.value.subnet
  region  = each.value.region
  project = each.value.host_project
}

output "shared_vpc_subnet" {
  value = data.google_compute_subnetwork.shared_vpc_subnet
}

/*
    shared_vpcs = optional(object({
      project = string
      subnets = list(object({
        region = string
        subnet = string
      }))
    }))
*/
