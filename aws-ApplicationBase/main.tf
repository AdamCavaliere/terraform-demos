provider "aws" {
  region = "${data.terraform_remote_state.networkdetails.region}"
}

data "terraform_remote_state" "networkdetails" {
  backend = "atlas"

  config {
    name = "azc/${var.network_workspace}"
  }
}

module "ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "1.3.0"

  instance_count              = 2
  name                        = "${var.application_name}"
  ami                         = "${var.ami_id}"
  instance_type               = "t2.medium"
  subnet_id                   = "${element(data.terraform_remote_state.networkdetails.public_subnets, 0)}"
  vpc_security_group_ids      = ["${data.terraform_remote_state.networkdetails.security_group}"]
  associate_public_ip_address = true
  key_name                    = "AZC"
  volume_size                 = 50

  tags = {
    Owner = "Adam"
    TTL   = "5"
  }
}
