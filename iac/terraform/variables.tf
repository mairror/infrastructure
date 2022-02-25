variable "region" {
  type        = string
  description = "AWS Region to use by the provider"
  default     = "eu-central-1"
}

## VPC VARIABLES

variable "vpc_cidr" {
  type        = string
  description = "VPC cidr to use"
  default     = "10.20.0.0/16"
}

variable "vpc_cidr_private_subnets" {
  type        = list(string)
  description = "Private subnets cidr az-1, az-2, az-3"
  default     = ["10.20.0.0/24", "10.20.1.0/24", "10.20.2.0/24"]
}

variable "vpc_cidr_public_subnets" {
  type        = list(string)
  description = "Public subnets cidr az-1, az-2, az-3"
  default     = ["10.20.10.0/24", "10.20.11.0/24", "10.20.12.0/24"]
}

variable "vpc_name" {
  type        = string
  description = "VPC name"
  default     = "mairror-vpc"
}

# S3 VARIABLES

variable "tf_state_bucket" {
  type        = string
  description = "Bucket to save the state"
  default     = "test_bucket_name"
}

variable "mairror_bucket_name" {
  type        = string
  description = "Bucket name to save images"
  default     = "mairror_test_bucket"
}
