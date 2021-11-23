#
# Network Hub project for Shared VPCs
#

module "network_hub" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 11.2" # local.project_factory_version

  name              = var.projects["network-hub"].name
  org_id            = var.gcp_organization_id
  project_id        = var.projects["network-hub"].id
  folder_id         = var.projects["network-hub"].folder == null ? null : lookup(local.folder_ids, var.projects["network-hub"].folder, null)
  random_project_id = var.projects["network-hub"].random_project_id == false ? false : true
  billing_account   = var.projects["network-hub"].billing_account == null ? var.gcp_default_billing_account : var.projects["network-hub"].billing_account

  activate_apis = concat(
    var.default_apis,
    var.projects["network-hub"].apis == null ? [] : var.projects["network-hub"].apis,
  )

  labels = merge(
    var.default_common_project_labels,
    var.projects["network-hub"].labels == null ? {} : var.projects["network-hub"].labels,
  )
}

