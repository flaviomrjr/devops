provider "aws" {
	version = "~> 2.0"
	region  = "us-east-1"
}

resource "aws_instance" "dockermanager" {
	ami = var.ami
	instance_type = "t2.medium"
	availability_zone = "us-east-1a"
        subnet_id = "subnet-xxxxxxxxxxxxxx"	
	key_name = var.key_name
	root_block_device {
		volume_size = 50
		volume_type = "gp2"
		delete_on_termination = false
	}
	tags = {
		Name = "DOCKER-MANAGER"
		Projeto = "TI"
                DevOps = "DOCKER-SWARM"	
	}
	vpc_security_group_ids = ["${aws_security_group.DockerManager.id}"]
}
