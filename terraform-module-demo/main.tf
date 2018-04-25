provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "server" {
  ami           = "ami-6c4f4a0c"
  instance_type = "t2.micro"

  tags {
    Name = "Example Module Use"
  }

  subnet_id = "${}"
}
