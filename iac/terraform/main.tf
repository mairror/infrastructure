terraform {
  backend "s3" {
    bucket = "mairror-tfstate"
    region = var.region
  }
}
