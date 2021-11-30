#
# Organization Policy configurations for folders
#

locals {
  folder_ids = distinct(flatten([
    for policy in var.organization_policies : policy.folder_ids == null ? [] : policy.folder_ids
  ]))

  folder_policies = flatten([
    for policy in var.organization_policies : [
      for folder_id in policy.folder_ids == null ? [] : policy.folder_ids : {
        index         = join("_", [folder_id, policy.policy])
        folder        = folder_id
        policy_name   = policy.policy
        configuration = policy
      }
    ]
  ])
}

data "google_folder" "policy" {
  for_each = toset(local.folder_ids)

  folder              = "folders/${each.key}"
  lookup_organization = false
}

resource "google_org_policy_policy" "folder" {
  for_each = {
    for folder_policy in local.folder_policies : folder_policy.index => folder_policy
  }

  name   = "${data.google_folder.policy[each.value.folder].name}/policies/${each.value.policy_name}"
  parent = data.google_folder.policy[each.value.folder].name

  spec {
    rules {
      enforce = each.value.configuration.enforce
    }
  }
}
