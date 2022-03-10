terraform {
  backend "s3" {
    bucket = "mairror-tfstate"
    key    = "terraform.tfstate"
    region = "eu-central-1"
  }
}
