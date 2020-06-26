resource "aws_eip_association" "eip_dockermanager" {
  instance_id   = "${aws_instance.dockermanager.id}"
  allocation_id = "eipalloc-xxxxxxxxxxxxxxx"
}
