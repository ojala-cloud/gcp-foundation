#
# GCP Foundation
#

#
# Folder policy enforcement
#

folder_policies = [
  {
    folder_name = "heroku"
    folder_id   = "922300282196"
    policies = [
      {
        policy  = "constraints/sql.restrictPublicIp"
        enforce = "true"
      },
      {
        policy  = "constraints/compute.restrictVpcPeering"
        enforce = "true"
      },
      {
        policy  = "constraints/compute.vmExternalIpAccess"
        enforce = "true"
      },
    ]
  },
  {
    folder_name = "k-ruoka"
    folder_id   = "1085857631605"
    policies = [
      {
        policy  = "constraints/compute.vmExternalIpAccess"
        enforce = "true"
      },
    ]
  }
]

#
# Development defaults
#

gcp_default_terraform_project = "home-infrastructure-254608"
gcp_default_region            = "europe-north1"
gcp_organization_id           = "237024123207"
