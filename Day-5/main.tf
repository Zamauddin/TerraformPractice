resource "aws_instance" "name" {
   ami = "ami-013168dc3850ef002"
  instance_type = "t2.micro"
  key_name = "NewD"
  tags = {
    Name = "Dependency"
  }
}


resource "aws_s3_bucket" "name" {
  bucket = "mybucketnicebucket"
      depends_on = [ aws_instance.name]

}