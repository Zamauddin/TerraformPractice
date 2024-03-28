variable "tio" {
    type = string
    default = "ywattttt"
  
}

variable "cleo" {
    type = string
    default = "wyatttt"
  
}

locals {
  bucket-name = "${var.tio}-${var.cleo}-mycoolbucket"
}

resource "aws_s3_bucket" "name" {
   # bucket = "${var.tio}-${var.cleo}-my"
   bucket = local.bucket-name
}