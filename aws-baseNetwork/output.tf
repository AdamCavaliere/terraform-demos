output "public_subnets" {
  value = "${module.vpc.public_subnets}"
}

output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}

output "region" {
  value = "${var.aws_region}"
}
