#
# Organization Policy configurations for organization
#

locals {
  org_policies = flatten([
    for policy in var.organization_policies : {
      index         = join("_", ["org", policy.policy])
      policy_name   = policy.policy
      configuration = policy
    } if policy.organization == true
  ])
}

resource "google_org_policy_policy" "organization" {
  for_each = {
    for org_policy in local.org_policies : org_policy.index => org_policy
  }

  name   = "organizations/${var.gcp_organization_id}/policies/${each.value.policy_name}"
  parent = "organizations/${var.gcp_organization_id}"

  spec {
    rules {
      enforce = each.value.configuration.enforce
    }
  }
}

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

#
# Organization Policy configurations for projects
#

locals {
  project_policies = flatten([
    for policy in var.organization_policies : [
      for project_id in policy.project_ids == null ? [] : policy.project_ids : {
        index         = join("_", [project_id, policy.policy])
        project       = project_id
        policy_name   = policy.policy
        configuration = policy
      }
    ]
  ])
}

resource "google_org_policy_policy" "project" {
  for_each = {
    for project_policy in local.project_policies : project_policy.index => project_policy
  }

  name   = "projects/${each.value.project}/policies/${each.value.policy_name}"
  parent = "projects/${each.value.project}"

  spec {
    rules {
      enforce = each.value.configuration.enforce
    }
  }
}
