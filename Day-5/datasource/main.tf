resource "aws_instance" "Nein" {
  ami = data.aws_ami.coollinux.id
  instance_type = "t2.micro"
  key_name = "NewD"
  tags = {
    Name = "Nein"
  }
  subnet_id = data.aws_subnet.Sub1.id
  security_groups = [data.aws_security_group.Mysg.id]
}