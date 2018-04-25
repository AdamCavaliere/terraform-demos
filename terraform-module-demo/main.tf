provider "aws" {}

//--------------------------------------------------------------------
// Modules
module "network" {
  source  = "app.terraform.io/azc/network/aws"
  version = "0.1.0"

  region                   = "us-east-1"
  subnet_availability_zone = "us-east-1a"
}

resource "aws_instance" "server" {
  ami           = "ami-6c4f4a0c"
  instance_type = "t2.micro"

  tags {
    Name = "Example Module Use"
  }

  subnet_id = "${module.network.demo_subnet_id}"
}
