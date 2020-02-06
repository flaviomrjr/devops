output "ips" {
	value = "${aws_instance.dev4.public_ip}"
}
