output "Instance_address" {
  value = "${aws_instance.example.public_ip}"
}
output "VPC Info" {
  value = "${aws_vpc.main.id}"
}
