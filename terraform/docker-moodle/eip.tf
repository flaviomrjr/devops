resource "aws_eip_association" "eip_dockermoodle" {
  instance_id   = "${aws_instance.dockermoodle.id}"
  allocation_id = "eipalloc-xxxxxx"
}
