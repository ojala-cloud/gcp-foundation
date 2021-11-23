#
# Initialize Github Actions Workflows
#

locals {
  default_workflow_template_file = "${path.module}/workflow.yaml.template"
  default_terraform_version      = "1.0.11"
  default_name                   = "Terraform CI/CD"
  google_credentials             = "$${{ secrets.GOOGLE_CREDENTIALS }}"
}

resource "local_file" "github_actions_workflow" {
  for_each = {
    for k, v in var.section : k => v
    if v.workflow_enabled != false
  }

  content = templatefile(each.value.template_file == null ? local.default_workflow_template_file : "${path.module}/${each.value.template_file}", {
    # Directory for templates
    section = each.key,
    # Name for Github Actions pipeline
    name = each.value.name == null ? local.default_name : each.value.name
    # Required terraform version
    terraform_version = each.value.terraform_version == null ? local.default_terraform_version : each.value.terraform_version,
    # Google Service Account credentials
    google_credentials = each.value.google_credentials == null ? local.google_credentials : each.value.google_credentials
  })

  filename        = "${path.module}/../.github/workflows/${each.key}.yaml"
  file_permission = "0755"
}
