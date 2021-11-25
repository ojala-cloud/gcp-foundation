#
# Project Factory provisioning
#

module "project" {
  for_each = var.projects

  source  = "terraform-google-modules/project-factory/google"
  version = "~> 11.2" # local.project_factory_version

  name              = each.value.name
  org_id            = var.gcp_organization_id
  project_id        = each.value.id
  folder_id         = each.value.folder == null ? null : lookup(lookup(local.folder_structure, each.value.folder, {}), "id", null)
  random_project_id = each.value.random_project_id == false ? false : true
  billing_account   = each.value.billing_account == null ? var.gcp_default_billing_account : each.value.billing_account

  # Module doesn't use null yet
  svpc_host_project_id = each.value.shared_vpcs == null ? "" : each.value.shared_vpcs.project
  shared_vpc_subnets = [
    for subnet in lookup(local.shared_vpc_subnets, each.key, []) : "projects/${subnet.host_project}/regions/${subnet.region}/subnetworks/${subnet.subnet}"
    #for subnet in lookup(local.shared_vpc_subnets, each.key, []) : data.google_compute_subnetwork.shared_vpc_subnet[subnet.index].name
  ]

  activate_apis = concat(
    var.default_apis,
    each.value.apis == null ? [] : each.value.apis,
  )

  labels = merge(
    var.default_project_labels,
    each.value.labels == null ? {} : each.value.labels,
  )
}
