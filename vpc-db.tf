# Internet VPC
resource "aws_vpc" "db" {
  cidr_block           = "192.168.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = {
    Name = "db"
  }
}

# Subnets
resource "aws_subnet" "db-public-1" {
  vpc_id                  = aws_vpc.db.id
  cidr_block              = "192.168.0.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "db-public"
  }
}


# Internet GW
resource "aws_internet_gateway" "db-gw" {
  vpc_id = aws_vpc.db.id

  tags = {
    Name = "db-db"
  }
}

# route tables
resource "aws_route_table" "db-public" {
  vpc_id = aws_vpc.db.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.db-gw.id
  }

  tags = {
    Name = "db-public-db"
  }
}

# route associations public
resource "aws_route_table_association" "db-public-1" {
  subnet_id      = aws_subnet.db-public-1.id
  route_table_id = aws_route_table.db-public.id
}

