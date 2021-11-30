#
# Collect information about shared VPC subnets
#

locals {
  #
  # Build an array of objects for each Shared VPC subnet service account details
  # key = project name in code, value = object of details
  #
  shared_vpc_subnets = {
    for name, project in local.all_projects : name => flatten([
      for subnet in project.shared_vpcs == null ? [] : lookup(project.shared_vpcs, "subnets", []) : {
        index        = join("_", [name, project.shared_vpcs.project, subnet.region, subnet.subnet])
        project_name = name
        host_project = lookup(var.shared_vpc_projects, project.shared_vpcs.project, null)
        region       = subnet.region
        subnet       = subnet.subnet
      }
    ])
  }

  shared_vpc_subnets_list = flatten([
    for project, subnets in local.shared_vpc_subnets : [
      for subnet in subnets : subnet
    ]
  ])
}

data "google_compute_subnetwork" "shared_vpc_subnet" {
  for_each = {
    for subnet in local.shared_vpc_subnets_list : subnet.index => subnet
  }

  name    = each.value.subnet
  region  = each.value.region
  project = each.value.host_project
}
