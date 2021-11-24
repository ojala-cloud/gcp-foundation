#
# Terraform settings
#

terraform {
  experiments = [module_variable_optional_attrs]

  required_version = "~> 0.14.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.1.0, < 5.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 4.1.0, < 5.0"
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

  #
  # Backend is local for init initially, after deployment moved to GCS
  #
  backend "gcs" {
    bucket = "pojala-terraform-init"
    prefix = "tf-init"
  }
}
