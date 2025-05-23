resource "aws_vpc" "usecase" {
  cidr_block = var.vpc_cidr  
  tags = {    
    Name = "usecase-vpc"  
    }
}

resource "aws_subnet" "public_subnet_1" {  
  vpc_id            = aws_vpc.usecase.id
  cidr_block        = var.public_subnet_1_cidr
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-1"  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.usecase.id
  cidr_block        = var.public_subnet_2_cidr
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-2"  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.usecase.id
  cidr_block        = var.private_subnet_1_cidr  
  availability_zone = "us-east-1c"
  tags = {
    Name = "private-subnet-1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.usecase.id
  cidr_block        = var.private_subnet_2_cidr
  availability_zone = "us-east-1d"
  tags = {
    Name = "private-subnet-2"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.usecase.id
  tags = {
    Name = "internet-gateway"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.usecase.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table_association" "public_subnet_1_assoc" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_subnet_2_assoc" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.usecase.id
  tags = {
    Name = "private-route-table"
  }
}

resource "aws_route_table_association" "private_subnet_1_assoc" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private_subnet_2_assoc" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_rt.id
}
 
