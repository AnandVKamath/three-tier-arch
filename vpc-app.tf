# Internet VPC
resource "aws_vpc" "app" {
  cidr_block           = "172.16.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = {
    Name = "app"
  }
}

# Subnets
resource "aws_subnet" "app-public-1" {
  vpc_id                  = aws_vpc.app.id
  cidr_block              = "172.16.0.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "app-public"
  }
}


# Internet GW
resource "aws_internet_gateway" "app-gw" {
  vpc_id = aws_vpc.app.id

  tags = {
    Name = "app"
  }
}

# route tables
resource "aws_route_table" "app-public" {
  vpc_id = aws_vpc.app.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.app-gw.id
  }

  tags = {
    Name = "app-public-1"
  }
}

# route associations public
resource "aws_route_table_association" "app-public-1-a" {
  subnet_id      = aws_subnet.app-public-1.id
  route_table_id = aws_route_table.app-public.id
}

