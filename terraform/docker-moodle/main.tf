provider "aws" {
	version = "~> 2.0"
	region  = "sa-east-1"
}

resource "aws_instance" "dockermoodle" {
	ami = var.ami
	instance_type = "t3.xlarge"	
	key_name = var.key_name
	root_block_device {
		volume_size = 60
		volume_type = "gp2"
		delete_on_termination = false
	}
	tags = {
		Name = "DOCKER-MOODLE"
		Projeto = "TI"	
	}
	vpc_security_group_ids = ["${aws_security_group.DockerMoodle.id}"]
}
