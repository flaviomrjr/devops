output "publicip" {
	value = "${aws_instance.dockermoodle.public_ip}"
}
output "privateip" {
        value = "${aws_instance.dockermoodle.private_ip}"
}
