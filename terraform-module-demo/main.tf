provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_instance" "server" {
  ami           = "ami-6c4f4a0c"
  instance_type = "t2.micro"

  tags {
    Name = "Example Module Use"
  }

  subnet_id = ""
}
