#Creating Vpc
resource "aws_vpc" "Vpc" {
    tags = {
      Name = "Vpc"
    }
    cidr_block = "10.0.0.0/16"
}

#Creating IG and attaching IG to Vpc
resource "aws_internet_gateway" "MyIG" {
    vpc_id = aws_vpc.Vpc.id
  
}

#Creating Public Subnet
resource "aws_subnet" "Public" {
  vpc_id = aws_vpc.Vpc.id
  tags = {
    Name = "Public"
  }
  availability_zone = "ap-south-1a"
  cidr_block = "10.0.0.0/24"
}

#Creating Private Subnet
resource "aws_subnet" "Private" {
    vpc_id = aws_vpc.Vpc.id
    tags = {
      Name = "Private"
    }
    availability_zone = "ap-south-1b"
    cidr_block = "10.0.1.0/24"
}

#Creating RT1 and attaching it to IG
resource "aws_route_table" "RT1" {
  vpc_id = aws_vpc.Vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.MyIG.id
    
  }
}

#Subnet Association
resource "aws_route_table_association" "rT1" {
    route_table_id = aws_route_table.RT1.id
    subnet_id = aws_subnet.Public.id 
  
}

#Creating eip
resource "aws_eip" "eip" {
  
}

#Creating Nat Gateway
resource "aws_nat_gateway" "Nat" {

  subnet_id = aws_subnet.Public.id
  allocation_id = aws_eip.eip.id
}

#Creating RT and giving route to private subnet
resource "aws_route_table" "RT2" {
    vpc_id = aws_vpc.Vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.Nat.id
    }
  
}

#Private subnet association
resource "aws_route_table_association" "rT2" {
  route_table_id = aws_route_table.RT2.id
  subnet_id = aws_subnet.Private.id
}