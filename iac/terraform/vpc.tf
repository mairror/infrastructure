module "vpc" {
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

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
  }
  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1
  }
}
