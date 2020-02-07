output "publicip" {
	value = "${aws_instance.fileserveraws.public_ip}"
}
output "privateip" {
        value = "${aws_instance.fileserveraws.private_ip}"
}
