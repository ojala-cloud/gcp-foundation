#
# Heroku Projects
#

heroku_projects = {
  sandbox-project = {
    name              = "Demo SANDBOX Heroku project"
    id                = "ojala-heroku-sbx"
    random_project_id = true
    folder            = "heroku"
    labels = {
      "environment" = "sandbox",
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
  #
  # Simple production project in heroku folder
  # - access to prod subnet in Shared VPC
  #
  prod-project = {
    name              = "Demo PROD project"
    id                = "ojala-heroku-prod"
    random_project_id = true
    folder            = "heroku"
    shared_vpcs = {
      project = "common-shared-vpc"
      subnets = [
        {
          region = "europe-north1"
          subnet = "heroku-prod"
        },
      ]
    }
    labels = {
      "environment" = "prod",
    }
  }
  #
  # Simple sandbox project in heroku folder without Shared VPC access
  #
  sandbox-project = {
    name              = "Demo SANDBOX project"
    id                = "ojala-heroku-sandbox"
    random_project_id = true
    folder            = "heroku"
    labels = {
      "environment" = "sandbox",
    }
  }
}
