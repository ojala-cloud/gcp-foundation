# Project section

Project Factory to create workload projects that follow a common consistent configuration.

If more complex project provisioning is required, a separate module call be added with specific parameters.

## Modules

[Google Cloud Project Factory](https://github.com/terraform-google-modules/terraform-google-project-factory)

## Variables

### Project variables

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| heroku\_projects | Definitions for Heroku projects | map(object) | - | no |

Map key is an organization-wide unique identifier for the project and should have a common prefix for projects that are part of a
common set of projects (e.g. `heroku-`).

Projects object has the following data:

| Object data | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| name | GCP project name | string | - | yes |
| id | Unique GCP project id | string | - | yes |
| project\_group | Project group for common settings | string | - | no |
| folder | Name of folder for project | string | - | no |
| random\_project\_id | Add random suffix to project id | bool | false | no |
| apis | Additional APIs to enable for the project | list(string) | - | no |
| labels | Additional labels for the project | map(string) | - | no |
| shared\_vpcs | Shared VPC subnets to use | map(object) | - | no |

`shared_vpcs` object includes `project` to define the Shared VPC host project (through `shared_vpc_projects` map) and list of
subnets to use.  For each subnet the `region` and `subnet` name is defined.

### Common variables

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| shared\_vpc\_projects | Map shared VPC names to host projects  | map(string) | - | no |
| existing\_folders | List of existing folders in the organization | list(string) | - | no |
| folders | Folders to create | list(string) | - | yes |
| default\_apis | APIs to enable on all projects | list(string) | - | no |
| default\_project\_group\_apis | APIs to enable for each project group projects | map(list(string)) | - | no |
| default\_project\_labels |  Default labels for all projects | map(string) | - | no |
| default\_project\_group\_labels |  Default labels for each project group projects | map(map(string)) | - | no |
| gcp\_default\_region |  Default GCP region | string | europe-north1 | no |
| gcp\_organization\_id |  Default GCP Organization ID | string | - | yes |
| gcp\_default\_billing\_account | Default GCP billing account | string | - | yes |

### Internal variables

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| module\_versions | List of module versions used | map(string) | internal | no

