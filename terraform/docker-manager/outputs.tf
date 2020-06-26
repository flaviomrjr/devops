output "publicip" {
	value = "${aws_instance.dockermanager.public_ip}"
}
output "privateip" {
        value = "${aws_instance.dockermanager.private_ip}"
}
