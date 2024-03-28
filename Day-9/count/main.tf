 #resource "aws_instance" "myec2" {
 #    ami = "ami-05295b6e6c790593e"
 #    instance_type = "t2.micro"
 #    count = 2
 #    tags = {
 #    #   Name = "webec2"
 #      Name = "upping-${count.index}"
 #    }
 #}


variable "ami" {
    type = string
    default = "ami-05295b6e6c790593e"
  
}

variable "instance_type" {
    type = string
    default = "t2.micro"
  
}

variable "kewl" {
    type = list(string)
    default = [ "prod", "test" ]
  
}



resource "aws_instance" "kewl" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = "NewD"
  count = length(var.kewl)
  tags = {
    Name = var.kewl[count.index]
  }
}

