terraform {
  # required_version = "1.1.5"
  backend "s3" {
    bucket = "mairror-tfstate"
    key    = "terraform.tfstate"
    region = "eu-central-1"
  }
}
