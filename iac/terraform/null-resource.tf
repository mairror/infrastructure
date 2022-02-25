resource "null_resource" "network_value" {
  provisioner "local-exec" {
    command = "python3 network_values.py --vpc-id ${module.vpc.vpc_id} --public-a ${module.vpc.public_subnets[0]} --public-b ${module.vpc.public_subnets[1]} --private-a ${module.vpc.private_subnets[0]} --private-b ${module.vpc.private_subnets[1]}"
  }
}