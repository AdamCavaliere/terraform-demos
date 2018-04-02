provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_instance" "server" {
  ami               = "ami-0f0a16801b42b89e8"
  instance_type     = "t2.small"
  availability_zone = "us-east-2a"
  key_name          = "AZC"

  tags {
    Name  = "${var.app_name}-server-${count.index}"
    owner = "Adam Cavaliere"
    TTL   = -1
  }

  subnet_id = "${element(module.vpc.public_subnets, 0)}"
}
