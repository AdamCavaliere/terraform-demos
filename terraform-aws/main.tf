provider "aws" {
    region = "${var.aws_region}"
}

resource "aws_instance" "server" {
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  availability_zone = "${lookup(var.avail_zone, count.index)}"
  count = 2
  tags {
    owner = "Adam"
    TTL = 1
  }
  subnet_id = "${element(aws_subnet.sub.*.id, count.index)}"
}