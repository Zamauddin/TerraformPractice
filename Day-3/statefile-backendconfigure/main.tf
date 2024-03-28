resource "aws_instance" "coolname" {
    ami = var.ami
    key_name = var.key_name
    instance_type = var.instance_type
    availability_zone = "ap-south-1b"
    tags = {
      Name = "Day-4"
    }

}