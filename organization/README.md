# Organization section

Environment resources for GCP organization such as audit log sinks and organization policies.

Organization policies can be assigned to organization, folder and project level.

Currently only boolean policy constrains are supported.

## Modules

n/a

## Variables

### Section variables

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| organization_policies | Organization policy assignments | list(object) | - | no |

Each organization policy assignment has the following data:

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| policy | Policy name | string | - | yes |
| enforce | Enforce policy (boolean policy) | string | - | no |
| organization | Assign to GCP organization | bool | false | no |
| folder_ids | List of folder ids to assign to | list(string) | - | no |
| project_ids | List of project ids to assign to | list(string) | - | no |

### Common variables

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| gcp\_default\_region |  Default GCP region | string | europe-north1 | no |
| gcp\_organization\_id |  Default GCP Organization ID | string | - | yes |

### Internal variables

n/a
