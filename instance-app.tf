provider "aws" {
	region = "us-east-1"
	alias  = "us-east-2"
}


resource "aws_instance" "app" {
  ami           = "ami-046842448f9e74e7d"
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.app-public-1.id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-app-ssh.id]

  # the public SSH key
  key_name = aws_key_pair.mykeypair.key_name
  tags =  {
	Name = "App-Server-1"
	}
}

