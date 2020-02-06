provider "aws" {
	version = "~> 2.0"
	region  = "sa-east-1"
}

provider "aws" {
	alias = "us-east-2"
        version = "~> 2.0"
        region  = "us-east-2"
}

resource "aws_instance" "dev" {
	count = 2
	ami = "ami-05494b93950efa2fd"
	instance_type = "t2.micro"	
	key_name = var.key_name
	tags = {
		Name = "dev${count.index}"	
	}
	vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}

resource "aws_instance" "dev4" {
        ami = "ami-05494b93950efa2fd"
        instance_type = "t2.micro"
        key_name = var.key_name
        tags = {
                Name = "dev4"
        }
        vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
	depends_on = [aws_s3_bucket.terraformlabflavio]
}


resource "aws_instance" "dev5" {
        ami = var.amis["sa-east-1"]
        instance_type = "t2.micro"
        key_name = var.key_name
        tags = {
                Name = "dev5"
        }
        vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}

resource "aws_instance" "dev6" {
	provider = aws.us-east-2
        ami = var.amis["us-east-2"]
        instance_type = "t2.micro"
        key_name = var.key_name
        tags = {
                Name = "dev6"
        }
        vpc_security_group_ids = ["${aws_security_group.acesso-ssh-us-east-2.id}"]
	depends_on = [aws_dynamodb_table.dynamodb-homologacao]
}

resource "aws_instance" "dev7" {
        provider = aws.us-east-2
        ami = var.amis["us-east-2"]
        instance_type = "t2.micro"
        key_name = var.key_name
        tags = {
                Name = "dev7"
        }
        vpc_security_group_ids = ["${aws_security_group.acesso-ssh-us-east-2.id}"]
}

resource "aws_s3_bucket" "terraformlabflavio" {
	  bucket = "terraformlabflavio"
	  acl    = "private"
	  tags = {
	  	Name = "terraformlabflavio"
	  }
}

resource "aws_s3_bucket" "terraformlabflavio2" {
          bucket = "terraformlabflavio2"
          acl    = "private"
          tags = {
                Name = "terraformlabflavio2"
          }
}

resource "aws_dynamodb_table" "dynamodb-homologacao" {
 	provider = aws.us-east-2
  	name           = "GameScores"
	billing_mode   = "PAY_PER_REQUEST"
  	hash_key       = "UserId"
  	range_key      = "GameTitle"

	attribute {
    		name = "UserId"
    		type = "S"
  	}

  	attribute {
    		name = "GameTitle"
    	type = "S"
  	}
}

