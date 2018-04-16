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

module "security_group" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "azcMainSecurityGroup"
  description = "Security group for example usage with EC2 instance"
  vpc_id      = "${module.vpc.vpc_id}"

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "https-443-tcp", "ssh-tcp"]

  ingress_with_cidr_blocks = [
    {
      from_port   = 8200
      to_port     = 8201
      protocol    = "tcp"
      description = "Vault-Server"
      cidr_blocks = "0.0.0.0/0"
    },
  ]

  egress_rules = ["all-all"]

  tags = {
    Owner = "Adam"
  }
}

data "aws_route53_zone" "selected" {
  name = "spacelyspacesprockets.info."
}

resource "aws_route53_record" "www" {
  zone_id = "${data.aws_route53_zone.selected.zone_id}"
  name    = "${var.app_name}.spacelyspacesprockets.info"
  type    = "A"
  ttl     = "180"
  records = ["${aws_instance.server.public_ip}"]
}
