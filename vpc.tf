resource "aws_vpc" "myvpc" {
 cidr_block = "10.0.0.0/16"  
}

resource "aws_internet_gateway" "my_igw" {
vpc_id = aws_vpc.myvpc.id
}

resource "aws_route_table" "pubicrt" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
}

resource "aws_route_table_association" "publicroute" {
    route_table_id = aws_route_table.pubicrt.id
    subnet_id = aws_subnet.publicsubnet.id
}

resource "aws_subnet" "publicsubnet" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-west-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "PublicSubnet"
  }
}

resource "aws_subnet" "privatesubnet" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "eu-west-1a"
  tags = {
    Name = "PrivateSubnet"
  }
}