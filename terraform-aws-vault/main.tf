provider "aws" {
  region     = "${data.external.region.result["region"]}"
  access_key = "${data.vault_aws_access_credentials.aws_creds.access_key}"
  secret_key = "${data.vault_aws_access_credentials.aws_creds.secret_key}"
}

data "external" "region" {
  program = ["./delay-vault-aws", "${var.region}"]
}

data "terraform_remote_state" "networkdetails" {
  backend = "atlas"

  config {
    name = "azc/${var.network_workspace}"
  }
}

resource "aws_instance" "server" {
  ami                    = "${data.aws_ami.ubuntu.id}"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-2a"
  key_name               = "AZC"
  vpc_security_group_ids = ["${data.terraform_remote_state.networkdetails.security_group}"]

  tags {
    Name  = "${var.app_name}-server-${count.index}"
    owner = "Adam Cavaliere"
    TTL   = -1
  }

  subnet_id = "${element(data.terraform_remote_state.networkdetails.public_subnets, 0)}"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
