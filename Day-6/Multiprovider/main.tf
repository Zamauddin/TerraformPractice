provider "aws" {
  region = "ap-south-1"
}

provider "aws" {
    region = "us-east-1"
    alias = "np"
  
}

resource "aws_s3_bucket" "name" {
    bucket = "mynewcoolingbucket"
}

resource "aws_s3_bucket" "name2" {
     bucket = "leeeiopio"
     provider = aws.np
}