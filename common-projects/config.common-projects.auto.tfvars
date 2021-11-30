#
# GCP Foundation
#

#
# Common projects
#

default_common_project_labels = {
  "demo" = "key"
}

projects = {
  #
  # Network hub for Shared VPCs and connectivity
  #
  network-hub = {
    name              = "Demo Network Hub"
    id                = "ojala-network-hub"
    random_project_id = true
    folder            = "infrastructure"
    apis = [
      "compute.googleapis.com",
      "dns.googleapis.com",
    ]
  }
  #
  # DNS Hub for shared DNS infrastructure and Cloud DNS
  #
  dns-hub = {
    name              = "Demo DNS Hub"
    id                = "ojala-dns-hub"
    random_project_id = true
    folder            = "infrastructure"
    apis = [
      "compute.googleapis.com",
      "dns.googleapis.com",
    ]
  }
}
