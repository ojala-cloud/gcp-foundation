#
# K-Ruoka Projects
#

k_ruoka_projects = {
  #
  # Simple development project in heroku folder
  # - access to dev subnet in Shared VPC
  #
  analytics-dev = {
    name              = "Demo Analytics DEV project"
    id                = "ojala-k-ruoka-analytics-dev"
    random_project_id = true
    folder            = "k-ruoka"
    labels = {
      "environment" = "dev",
      "ml" = "analytics",
    }
  }
}
