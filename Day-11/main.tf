#Creating role #Task1
resource "aws_iam_role" "cool_role" {
  name = "cool_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = "examplerole"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

# attaching policy
resource "aws_iam_policy_attachment" "dev" {
       
         name = "dev"
   policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
        roles = [ aws_iam_role.cool_role.name ]

}

#attaching role
resource "aws_iam_instance_profile" "cool_role" {
    
    name = "cool_role"
    role = aws_iam_role.cool_role.name
  
}

#Instance Creation
resource "aws_instance" "task1" {
    ami                    = "ami-05295b6e6c790593e"      
  instance_type          = "t2.micro"
  key_name               = "NewD"              
  tags = {
    Name = "MycoolEc2"
  }
    iam_instance_profile = aws_iam_instance_profile.cool_role.name
}


#attaching existing role to new ec2 #Task2
resource "aws_instance" "task2" {

    ami           = "ami-05295b6e6c790593e"
    instance_type = "t2.micro"
    iam_instance_profile = "cool_role"
    tags          = {
             Name = "task2"
        }
    depends_on = [ aws_instance.task1 ]
}

##Creating IAM user and attaching s3 permission role #Task3

resource "aws_iam_user" "task3_user" {
        name = "task3_user"
    depends_on = [ aws_instance.task2 ]
}

resource "aws_iam_user_policy_attachment" "name" {
  user = aws_iam_user.task3_user.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  depends_on = [ aws_instance.task2 ]
}

  