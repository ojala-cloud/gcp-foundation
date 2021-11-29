#
# Heroku Projects
#

heroku_projects = {
  #
  # Simple development project in heroku folder
  # - access to dev subnet in Shared VPC
  #
  dev-project = {
    name              = "Demo DEV project"
    id                = "ojala-heroku-dev"
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
}
