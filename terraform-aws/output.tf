output "app_subnet" {
  value = "${aws_subnet.sub.*.id}"
}

output "cidr_block" {
  value = "${aws_vpc.main.cidr_block}"
}