#creating vpc
resource "aws_vpc" "NewVpc" {
  tags = {
    Name = "NewVpc"
  }
  cidr_block = "10.0.0.0/16"
  
}

#creating subnet
resource "aws_subnet" "name" {
  vpc_id = aws_vpc.NewVpc.id
  cidr_block = "10.0.0.0/18"
  
}

#creating IG and attaching to vpc
resource "aws_internet_gateway" "name" {
  vpc_id = aws_vpc.NewVpc.id
  
}

#creating route table and attaching to IG
resource "aws_route_table" "name" {
  vpc_id = aws_vpc.NewVpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.name.id
  }
  
}

# subnet association
resource "aws_route_table_association" "name" {
  route_table_id = aws_route_table.name.id
  subnet_id = aws_subnet.name.id
  
}

resource "aws_eip" "example" {
  
}

resource "aws_nat_gateway" "newnat" {
  subnet_id = aws_subnet.name.id
  allocation_id = aws_eip.example.id

  
}

#creating ec2
resource "aws_instance" "coolinstance" {
  subnet_id = aws_subnet.name.id
  availability_zone = "ap-south-1a"
   ami = var.ami
   instance_type = var.instance_type
    key_name = var.key_name
    tags = {
      Name = "Terraform"
    }
  
}