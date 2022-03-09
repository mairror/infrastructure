# https://www.terraform-best-practices.com/code-structure#getting-started-with-the-structuring-of-terraform-configurations

terraform {
  required_version = "~> 1.1.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }

    null = {
      source  = "hashicorp/null"
      version = "3.1.0"
    }
  }
}

provider "aws" {
  region = var.region
  default_tags {
    tags = {
      project     = var.project_name
      deployed_by = "terraform"
    }
  }
}
