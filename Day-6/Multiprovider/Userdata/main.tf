resource "aws_instance" "ec2" {
    ami = "ami-013168dc3850ef002"
    instance_type = "t2.micro"
    key_name = "NewD"
    tags = {
      Name = "Test"
    }
    security_groups = [ "Mysg" ]
    user_data = file("test.sh")
    availability_zone = "ap-south-1a"

    lifecycle {
  create_before_destroy = true
}

  #  lifecycle {
   #   prevent_destroy = true
    #}
       
       #   lifecycle {
#     ignore_changes = [tags,]
#   }



}

