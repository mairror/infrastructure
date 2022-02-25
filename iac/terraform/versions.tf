# https://www.terraform-best-practices.com/code-structure#getting-started-with-the-structuring-of-terraform-configurations

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.region
  default_tags {
    tags = {
      project     = "mairror"
      deployed_by = "terraform"
    }
  }
}
