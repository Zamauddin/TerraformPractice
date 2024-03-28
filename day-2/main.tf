resource "aws_instance" "kewl" {
  ami                    = "ami-05295b6e6c790593e"      
  instance_type          = "t2.micro"
  key_name               = "NewD"              
  tags = {
    Name = "MycoolEc2"
  }
}