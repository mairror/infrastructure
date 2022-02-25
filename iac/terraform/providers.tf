provider "aws" {
  region = var.region
  default_tags {
    tags = {
      project     = "mairror"
      deployed_by = "terraform"
    }
  }
}
