resource "aws_security_group" "allow-ssh" {
  vpc_id      = aws_vpc.web.id
  name        = "allow-ssh"
  description = "security group that allows ssh and all egress traffic"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["117.193.164.2/32"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["117.193.164.2/32"]
  }
  tags = {
    Name = "allow-ssh-ssl"
  }
}

