provider "aws" {
	region = "us-east-1"
}

provider "aws" {
	alias  = "uswest"
	region = "us-west-1"
}


resource "aws_instance" "web" {
  ami           = "ami-046842448f9e74e7d"
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.web-public-1.id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  # the public SSH key
  key_name = aws_key_pair.mykeypair.key_name
  tags =  {
	Name = "Web-Server-1"
	}
}

