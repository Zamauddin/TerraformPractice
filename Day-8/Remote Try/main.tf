module "newmod" {
    source = "../../Custom Vpc"
    ami = "ami-013168dc3850ef002"
    instance_type = "t2.micro"
    key_name = "NewD"
  
}