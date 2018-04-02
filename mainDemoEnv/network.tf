module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "azcMainVPC"
  cidr = "192.168.0.0/16"

  azs            = ["us-east-2a"]
  public_subnets = ["192.168.2.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Environment = "Prod"
    Owner       = "Adam"
  }
}
