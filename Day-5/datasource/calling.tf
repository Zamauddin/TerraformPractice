data "aws_security_group" "Mysg" {
  id = "sg-0ba4e496d8f09f827"
}

data "aws_subnet" "Sub1" {
  id = "subnet-0d8e6d42f915c6485"
}

data "aws_ami" "coollinux" {   
  most_recent   = true
  owners = [ "amazon" ]
  filter {
    name = "name"
    values = [ "amzn2-ami-hvm-*-gp2" ]
  }
  filter {
    name = "root-device-type"
    values = [ "ebs" ]
  }
  filter {
    name = "virtualization-type"
    values = [ "hvm" ]
  }
  filter {
    name = "architecture"
    values = [ "x86_64" ]
  }
}


