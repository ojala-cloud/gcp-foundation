#
# DNS Hub project for Cloud DNS
#

module "dns_hub" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 11.2" # local.project_factory_version

  name       = var.projects["dns-hub"].name
  org_id     = var.gcp_organization_id
  project_id = var.projects["dns-hub"].id
  #folder_id         = var.projects["dns-hub"].folder == null ? null : lookup(local.folder_ids, var.projects["dns-hub"].folder, null)
  folder_id         = var.projects["dns-hub"].folder == null ? null : lookup(lookup(local.folder_structure, var.projects["dns-hub"].folder, {}), "id", null)
  random_project_id = var.projects["dns-hub"].random_project_id == false ? false : true
  billing_account   = var.projects["dns-hub"].billing_account == null ? var.gcp_default_billing_account : var.projects["dns-hub"].billing_account

  activate_apis = concat(
    var.default_apis,
    var.projects["dns-hub"].apis == null ? [] : var.projects["dns-hub"].apis,
  )

  labels = merge(
    var.default_common_project_labels,
    var.projects["dns-hub"].labels == null ? {} : var.projects["dns-hub"].labels,
  )
}

