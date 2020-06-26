resource "aws_security_group" "DockerMoodle" {
  name        = "DockerMoodle"
  description = "Docker Moodle Security Group"

  ingress {
    description = "Allow all ports to TEDs network"
    from_port   = 0 
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.cdirs_full_access
  }

  ingress {
    description = "HTTP port to Internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS port to Internet"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description     = "Allow internet connection"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
    Name = "DockerMoodle"
  }
}
