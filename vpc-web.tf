# Internet VPC
resource "aws_vpc" "web" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = {
    Name = "web"
  }
}

# Subnets
resource "aws_subnet" "web-public-1" {
  vpc_id                  = aws_vpc.web.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "web-public"
  }
}


# Internet GW
resource "aws_internet_gateway" "web-gw" {
  vpc_id = aws_vpc.web.id

  tags = {
    Name = "web"
  }
}

# route tables
resource "aws_route_table" "web-public" {
  vpc_id = aws_vpc.web.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.web-gw.id
  }

  tags = {
    Name = "web-public"
  }
}

# route associations public
resource "aws_route_table_association" "web-public-1-a" {
  subnet_id      = aws_subnet.web-public-1.id
  route_table_id = aws_route_table.web-public.id
}

