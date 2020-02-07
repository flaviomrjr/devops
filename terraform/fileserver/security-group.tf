resource "aws_security_group" "FileServer" {
  name        = "FileServer"
  description = "FileServer Security Group"

  ingress {
    from_port   = 0 
    to_port     = 65535
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = var.cdirs_full_access
  }

	egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
    Name = "FileServer"
  }
}
