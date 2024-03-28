#Creating Pub Ec2
resource "aws_instance" "PublicEc2" {
  subnet_id = aws_subnet.Public.id
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  security_groups = [ "Mysg" ]
  tags = {
    Name = "PublicEc2"
  }
  associate_public_ip_address = true

}

#Creating SG
resource "aws_security_group" "Mysg2" {
    vpc_id = aws_vpc.Vpc.id
    tags = {
      Name = "Mysg2"
    }
    egress {
        description = "outbound connection"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}

#Creating Pri Ec2
resource "aws_instance" "PrivateEc2" {
  subnet_id = aws_subnet.Private.id
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  security_groups = [ aws_security_group.Mysg2.id ]
  tags = {
    Name = "PrivatecEc2"
  }
}
