#
# Heroku Projects
#

heroku_projects = {
  #
  # Simple development project in heroku folder
  # - access to dev subnet in Shared VPC
  #
  dev-project = {
    name              = "Demo DEV 1 project"
    id                = "ojala-1-heroku-dev"
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
  dev2-project = {
    name              = "Demo DEV 2 project"
    id                = "ojala-2-heroku-dev"
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
}
