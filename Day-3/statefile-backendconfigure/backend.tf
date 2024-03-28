terraform {
  backend "s3" {
    bucket = "cool-statefile-config"
    key = "terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "my-terraform-state-lock-dynamo"
    encrypt = true
    
  }
}