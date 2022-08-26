resource "aws_security_group" "worker_group_mgmt_one" {
  #checkov:skip=CKV2_AWS_5: "Ensure that Security Groups are attached to another resource"
  description = "Allow access to management network"
  name_prefix = "worker_group_mgmt_one"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "Allow SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"

    cidr_blocks = [
      "10.0.0.0/8",
    ]
  }
}

resource "aws_security_group" "worker_group_mgmt_two" {
  #checkov:skip=CKV2_AWS_5: "Ensure that Security Groups are attached to another resource"
  description = "Worker group management two allow SSH"
  name_prefix = "worker_group_mgmt_two"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "Allow SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"

    cidr_blocks = [
      "192.168.0.0/16",
    ]
  }
}

resource "aws_security_group" "all_worker_mgmt" {
  #checkov:skip=CKV2_AWS_5: "Ensure that Security Groups are attached to another resource"
  description = "All worker management allow SSH"
  name_prefix = "all_worker_management"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "Allow SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"

    cidr_blocks = [
      "10.0.0.0/8",
      "172.16.0.0/12",
      "192.168.0.0/16",
    ]
  }
}
