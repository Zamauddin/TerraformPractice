module "newmd" {
  source = "github.com/terraform-aws-modules/terraform-aws-ec2-instance"
    ami = "ami-013168dc3850ef002"
    instance_type          = "t2.micro"
    key_name               = "NewD"
    monitoring             = true
}