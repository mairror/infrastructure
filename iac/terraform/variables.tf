variable "region" {
  type        = string
  description = "AWS Region to use by the provider"
  default     = "eu-central-1"
}

## VPC VARIABLES

variable "cidr_vpc" {
  type        = string
  description = "VPC cidr to use"
  default     = "10.20.0.0/16"
}

variable "cidr_private_subnets" {
  type        = list(string)
  description = "Private subnets cidr az-1, az-2, az-3"
  default     = ["10.20.0.0/24", "10.20.1.0/24", "10.20.2.0/24"]
}

variable "cidr_public_subnets" {
  type        = list(string)
  description = "Public subnets cidr az-1, az-2, az-3"
  default     = ["10.20.10.0/24", "10.20.11.0/24", "10.20.12.0/24"]
}

