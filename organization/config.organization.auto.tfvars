#
# GCP Foundation
#

#
# Organization policy enforcement
#
# https://cloud.google.com/resource-manager/docs/organization-policy/org-policy-constraints
#

organization_policies = [
  {
    policy = "constraints/sql.restrictPublicIp"
    # 
    # Restrict public IP access on Cloud SQL instances
    # boolean constraint
    #
    enforce      = "TRUE"
    organization = true
    folder_ids = [
      "922300282196",  # heroku
      "1085857631605", # k-ruoka
    ]
  },
  {
    policy = "constraints/iam.disableServiceAccountKeyUpload"
    #
    # Disable Service Account Key Upload
    # boolean constraint
    #
    enforce = "TRUE"
    folder_ids = [
      "1085857631605", # k-ruoka
    ]
    project_ids = [
      "ojala-network-hub-e0c7",
      "shared-vpc-329414",
    ]
  },
]
