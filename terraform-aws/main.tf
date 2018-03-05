provider "aws" {
    region = "${var.aws_region}"
}

resource "aws_instance" "foo" {
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  availability_zone = "${lookup(var.avail_zone, count.index)}"
  count = 2
  tags {
    owner = "Adam"
    TTL = 1
  }
  subnet_id = "${element(data.terraform_remote_state.vpc.app_subnet, count.index)}"
}