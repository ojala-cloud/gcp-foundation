# Network section

Common network infrastructure for GCP environment:

- Shared VPCs to host projects
- Common Cloud DNS and DNS forwarding configurations
- External connectivity through Direct InterConnect and VPNs

All features are not yet implemented.

## Modules

[Google Cloud Network Module](https://github.com/terraform-google-modules/terraform-google-network)

## Variables

### Shared VPC variables

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| shared_vpcs | Definitions for Shared VPC hosts | map(object) | - | no |

Map key is an organization-wide unique identifier for the Shared VPC (in Terraform).

Shared VPC object has the following data:

| Object data | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| name | Shared VPC name | string | - | yes |
| project_id | Shared VPC Host project ID | string | - | yes |
| shared_vpc_host | Define VPC as Shared VPC host | bool | true | no |
| subnets | List of subnets to Shared VPC | list(map(string)) | - | no |

`subnets` list defines each subnet in the Shared VPC.  For each subnet one should define `subnet_name`, `subnet_ip` (IP CIDR range) and `subnet_region`.

### Common variables

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| gcp\_default\_region |  Default GCP region | string | europe-north1 | no |
| gcp\_organization\_id |  Default GCP Organization ID | string | - | yes |

### Internal variables

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| module\_versions | List of module versions used | map(string) | internal | no

