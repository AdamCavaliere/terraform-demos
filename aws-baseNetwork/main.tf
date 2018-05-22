module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "VPC-${var.network_name}"
  cidr = "10.0.0.0/16"

  azs            = ["us-west-1a", "us-west-1c"]
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform   = "true"
    Environment = "${var.environment}"
    Owner       = "Adam"
  }
}

module "security_group" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "Base-Secuirty-${var.network_name}"
  description = "Security group"
  vpc_id      = "${module.vpc.vpc_id}"

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "all-icmp", "ssh-tcp"]
  egress_rules        = ["all-all"]

  tags = {
    Name        = "Adam"
    Environment = "${var.environment}"
  }
}
