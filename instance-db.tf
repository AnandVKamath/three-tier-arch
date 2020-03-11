provider "aws" {
	alias  = "us-east-1"
	region = "us-east-1"
}

resource "aws_instance" "db" {
  ami           = "ami-046842448f9e74e7d"
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.db-public-1.id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-db-ssh.id]

  # the public SSH key
  key_name = aws_key_pair.mykeypair.key_name
  tags =  {
	Name = "Database-Server-1"
	}
}

