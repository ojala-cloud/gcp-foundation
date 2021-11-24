#
# Terraform settings
#

terraform {
  experiments = [module_variable_optional_attrs]

  #required_version = "~> 1.0.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 3.50, < 5.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 3.50, < 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.1.0"
    }
    time = {
      source  = "hashicorp/time"
      version = "~> 0.7.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0.0"
    }
  }

  backend "gcs" {
    bucket = "pojala-terraform-projects"
    prefix = "tf-projects"
  }
}
