#
# Heroku Projects
#

heroku_projects = {
/*
  #
  # Simple development project in heroku folder
  # - access to dev subnet in Shared VPC
  #
  heroku-app42-dev = {
    name              = "App 42 DEV Poject"
    id                = "heroku-app42"
    project_group     = "heroku"
    random_project_id = true
    folder            = "heroku"
    labels = {
      "environment" = "dev",
    }
    #
    # Shared VPC access
    #
    shared_vpcs = {
      project = "common-shared-vpc"
      subnets = [
        {
          region = "europe-north1"
          subnet = "heroku-dev"
        },
      ]
    }
  }
*/
}
