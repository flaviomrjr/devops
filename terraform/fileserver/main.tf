provider "aws" {
	version = "~> 2.0"
	region  = "sa-east-1"
}

resource "aws_instance" "fileserveraws" {
	ami = var.ami
	instance_type = "t3.large"	
	key_name = var.key_name
	root_block_device {
		volume_size = 60
		volume_type = "gp2"
		delete_on_termination = false
	}
	tags = {
		Name = "FILESERVER-AWS"	
	}
	vpc_security_group_ids = ["${aws_security_group.FileServer.id}"]
}
