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
    default = [ "dev", "Prod" ]
  
}

resource "aws_instance" "kewll" {
    ami = var.ami
    instance_type = var.instance_type
    for_each = toset(var.kewl)
    tags = {
      Name = each.value
    }

  
}