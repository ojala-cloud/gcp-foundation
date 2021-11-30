# Init (bootstrap) section

Initialisation code for GitHub Actions workflows, Terraform Service Accounts and Storage buckets for Terraform state files.  As these may
require folders as well, support for folders is included in the templates.

As the templates also build the GitHub Actions Workflow YAML files, they need to be updated locally and pushed back to the repository.
The workflow currently doesn't support updating local files and pushing them to the repository from the workflow.

## Modules

n/a

## Variables

### Section variables

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| section | Definitions for sections | map(object) | - | no |

Map key is the name of the section that *must* be the same as the directory for the code.  Each section contains the following data:

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| name | Name for section | string | "Terraform CI/CD" | no |
| description | Section description | string | - | yes |
| directory | Section directory (not used) | string | - | no |
| features | Section features to enable (not used) | map(bool) | - | no |
| description | Section description | string | - | yes |
| terraform_version | Terraform version for the workflow | string | 1.0.11 | no |
| terraform_project | GCP Project for the Terraform storage | string | gcp_default_terraform_project | no |
| template_file | Workflow YAML template file | string | workflow.yaml.template | no |
| google_credentials | Credentials for workflow, e.g. reference to GitHub Secret | string | "$${{ secrets.GOOGLE_CREDENTIALS }}" | no |
| workflow_enabled | Enable GitHub Actions Workflow | bool | true | no |
| organization_roles | Service Account roles to organization | list(string) | - | no |
| folder_roles | Service Account roles to folders | map(list(string)) | - | no |
| project_roles | Service Account roles to projects | map(list(string)) | - | no |

Permissions list roles to bind for the specific Terraform Service Account.  Folders and Projects use a map where they map key is the folder or project name.

### Common variables

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| gcp\_default\_terraform\_project |  Default project for GCP Terraform storage buckets | string | - | yes |
| gcp\_default\_region |  Default GCP region | string | europe-north1 | no |
| common\_prefix |  Common prefix for GCP resources | string | - | yes |
| gcp\_organization\_id |  Default GCP Organization ID | string | - | yes |

### Internal variables

n/a
