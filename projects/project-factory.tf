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

  activate_apis = concat(
    var.default_apis,
    each.value.apis == null ? [] : each.value.apis,
  )

  labels = merge(
    var.default_project_labels,
    each.value.labels == null ? {} : each.value.labels,
  )
}
