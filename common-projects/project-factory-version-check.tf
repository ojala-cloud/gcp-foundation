# 
# Module version checks
#

locals {
  project_factory_version = "~> 11.2"
}

data "local_file" "project_factory_module_version_check" {
  #
  # Check that project factory version is correct
  #
  count    = var.module_versions["project-factory"] == local.project_factory_version ? 0 : 1
  filename = "ERROR: Project Factory module version is not correct"
}
