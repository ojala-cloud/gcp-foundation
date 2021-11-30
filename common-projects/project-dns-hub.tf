#
# DNS Hub project for Cloud DNS
#

locals {
  project_id_dns_hub = "dns-hub"
}

module "dns_hub" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 11.2" # local.project_factory_version

  name       = var.projects[local.project_id_dns_hub].name
  org_id     = var.gcp_organization_id
  project_id = var.projects[local.project_id_dns_hub].id
  folder_id         = var.projects[local.project_id_dns_hub].folder == null ? null : lookup(lookup(local.folder_structure, var.projects[local.project_id_dns_hub].folder, {}), "id", null)
  random_project_id = var.projects[local.project_id_dns_hub].random_project_id == false ? false : true
  billing_account   = var.projects[local.project_id_dns_hub].billing_account == null ? var.gcp_default_billing_account : var.projects[local.project_id_dns_hub].billing_account

  activate_apis = concat(
    var.default_apis,
    var.projects[local.project_id_dns_hub].apis == null ? [] : var.projects[local.project_id_dns_hub].apis,
  )

  labels = merge(
    var.default_common_project_labels,
    var.projects[local.project_id_dns_hub].labels == null ? {} : var.projects[local.project_id_dns_hub].labels,
  )
}
