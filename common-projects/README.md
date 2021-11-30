# Common Projects section

Common Projects is a section to create all the common GCP projects and related resources that are used
by the shared, common GCP infrastructure such as audit and billing logging, external connectivity,
networking, DNS and Security.

Each common project is created as a separate module call although the configuration details are
from a common variable.

Folder support is included to create any folders that the common projects may require.

## Modules

[Google Cloud Project Factory](https://github.com/terraform-google-modules/terraform-google-project-factory)

## Variables

### Project variables

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| projects | Definitions for common projects | map(object) | - | no |

Map key is used from the Terraform template creating the project to access the parameters for the Project Factory module call
to avoid any hardcoded parameters.

Projects object has the following data:

| Object data | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| name | GCP project name | string | - | yes |
| id | Unique GCP project id | string | - | yes |
| folder | Name of folder for project | string | - | no |
| random\_project\_id | Add random suffix to project id | bool | false | no |
| billing\_account | Billing account for the project | string | - | no |
| apis | Additional APIs to enable for the project | list(string) | - | no |
| labels | Additional labels for the project | map(string) | - | no |

### Common variables

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| existing\_folders | List of existing folders in the organization | list(string) | - | no |
| folders | Folders to create | list(string) | - | yes |
| default\_apis | APIs to enable on all projects | list(string) | - | no |
| default\_common\_project\_labels |  Default labels for common projects | map(string) | - | no |
| gcp\_default\_region |  Default GCP region | string | europe-north1 | no |
| gcp\_organization\_id |  Default GCP Organization ID | string | - | yes |
| gcp\_default\_billing\_account | Default GCP billing account | string | - | yes |

### Internal variables

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| module\_versions | List of module versions used | map(string) | internal | no

