provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_instance" "server" {
  ami                    = "ami-a24f72c7"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-2a"
  key_name               = "AZC"
  vpc_security_group_ids = ["${module.security_group.this_security_group_id}"]

  tags {
    Name  = "${var.app_name}-server-${count.index}"
    owner = "Adam Cavaliere"
    TTL   = -1
  }

  subnet_id = "${element(module.vpc.public_subnets, 0)}"
}
