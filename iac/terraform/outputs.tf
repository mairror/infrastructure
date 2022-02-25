output "private_subnet" {
  description = "Private subnet ids"
  value       = module.vpc.private_subnets
}

output "public_subnet" {
  description = "Public subnet ids"
  value       = module.vpc.public_subnets
}

output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}