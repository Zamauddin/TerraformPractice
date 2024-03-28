resource "aws_instance" "kewl" {
  ami                    = "ami-05295b6e6c790593e"      
  instance_type          = "t2.micro"
  key_name               = "NewD"              
 
  tags = {
    Name = "MycoolEc2"
  }
}

resource "aws_security_group" "devops-project-veera" {
  name        = "coolsg"
  description = "allowing inbound traffic"

  ingress = [
    for port in [22, 80, 443,] : {
      description      = "inbound rules"
      from_port        = port
      to_port          = port
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "coolsg"
  }
}