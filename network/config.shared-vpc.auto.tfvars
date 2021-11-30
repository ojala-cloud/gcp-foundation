#
# Shared VPCs
#

shared_vpcs = {
  common-shared-vpc = {
    name       = "demo-shared-vpc",
    project_id = "ojala-network-hub-e0c7",
    subnets = [
      {
        subnet_name   = "heroku-dev",
        subnet_ip     = "10.0.1.0/24",
        subnet_region = "europe-north1",
      },
      {
        subnet_name   = "heroku-prod",
        subnet_ip     = "10.0.2.0/24",
        subnet_region = "europe-north1",
      },
    ]
  }
}
