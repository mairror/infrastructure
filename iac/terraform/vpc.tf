locals {
  cluster_name = "mairror-cluster"
}

module "vpc" {
  #checkov:skip=CKV2_AWS_12: "Ensure the default security group of every VPC restricts all traffic"
  #checkov:skip=CKV2_AWS_19: "Ensure that all EIP addresses allocated to a VPC are attached to EC2 instances"
  #checkov:skip=CKV2_AWS_11: "Ensure VPC flow logging is enabled in all VPCs"
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.0"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = data.aws_availability_zones.frankfurt.names
  private_subnets = var.vpc_cidr_private_subnets
  public_subnets  = var.vpc_cidr_public_subnets

  enable_nat_gateway     = true
  one_nat_gateway_per_az = false
  single_nat_gateway     = true
  # enable_dns_hostnames = true
  map_public_ip_on_launch = false

  tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = 1
  }
  public_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = 1
  }
}
