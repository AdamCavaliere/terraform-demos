output "public_ip_address" {
  value = "${module.ec2.public_ip}"
}