#
# Network Hub project for Shared VPCs
#

locals {
  project_id_network_hub = "network-hub"
}

module "network_hub" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 11.2" # local.project_factory_version

  name              = var.projects[local.project_id_network_hub].name
  org_id            = var.gcp_organization_id
  project_id        = var.projects[local.project_id_network_hub].id
  folder_id         = var.projects[local.project_id_network_hub].folder == null ? null : lookup(lookup(local.folder_structure, var.projects[local.project_id_network_hub].folder, {}), "id", null)
  random_project_id = var.projects[local.project_id_network_hub].random_project_id == false ? false : true
  billing_account   = var.projects[local.project_id_network_hub].billing_account == null ? var.gcp_default_billing_account : var.projects[local.project_id_network_hub].billing_account

  enable_shared_vpc_host_project = true

  activate_apis = concat(
    var.default_apis,
    var.projects[local.project_id_network_hub].apis == null ? [] : var.projects[local.project_id_network_hub].apis,
  )

  labels = merge(
    var.default_common_project_labels,
    var.projects[local.project_id_network_hub].labels == null ? {} : var.projects[local.project_id_network_hub].labels,
  )
}

